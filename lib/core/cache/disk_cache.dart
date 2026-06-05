import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cache_data.dart';
import 'cache_index.dart';

class DiskCache {
  DiskCache._();

  static final _memoryCache = <String, _CacheEntry>{};
  static const int _maxMemoryEntries = 50;
  static const Duration _defaultTtl = Duration(hours: 24);

  static Future<Directory> _getCacheDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final cacheDir = Directory('${dir.path}/.cache');
    if (!await cacheDir.exists()) {
      await cacheDir.create(recursive: true);
    }
    return cacheDir;
  }

  static String _fileKey(String key) {
    return key.replaceAll(RegExp(r'[^\w]'), '_');
  }

  static Future<void> put(String key, CacheData data) async {
    _memoryCache[key] = _CacheEntry(data: data);

    if (_memoryCache.length > _maxMemoryEntries) {
      _evictOldest();
    }

    try {
      final dir = await _getCacheDir();
      final file = File('${dir.path}/${_fileKey(key)}.json');
      await file.writeAsString(jsonEncode(data.toJson()));

      final prefs = await SharedPreferences.getInstance();
      final index = _loadIndex(prefs);
      index[key] = CacheIndex(
        key: key,
        cachedAt: data.cachedAt,
        size: jsonEncode(data.toJson()).length,
      );
      await _saveIndex(prefs, index);
    } catch (_) {}
  }

  static Future<CacheData?> get(String key) async {
    final memory = _memoryCache[key];
    if (memory != null) {
      if (DateTime.now().difference(memory.data.cachedAt) < _defaultTtl) {
        return memory.data;
      }
      _memoryCache.remove(key);
    }

    try {
      final dir = await _getCacheDir();
      final file = File('${dir.path}/${_fileKey(key)}.json');
      if (await file.exists()) {
        final json = await file.readAsString();
        final data = CacheData.fromJson(jsonDecode(json) as Map<String, dynamic>);
        if (DateTime.now().difference(data.cachedAt) < _defaultTtl) {
          _memoryCache[key] = _CacheEntry(data: data);
          return data;
        }
        await file.delete();
      }
    } catch (_) {}

    return null;
  }

  static Future<void> remove(String key) async {
    _memoryCache.remove(key);

    try {
      final dir = await _getCacheDir();
      final file = File('${dir.path}/${_fileKey(key)}.json');
      if (await file.exists()) {
        await file.delete();
      }

      final prefs = await SharedPreferences.getInstance();
      final index = _loadIndex(prefs);
      index.remove(key);
      await _saveIndex(prefs, index);
    } catch (_) {}
  }

  static Future<void> clear() async {
    _memoryCache.clear();

    try {
      final dir = await _getCacheDir();
      if (await dir.exists()) {
        await dir.delete(recursive: true);
        await dir.create(recursive: true);
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('cache_index');
    } catch (_) {}
  }

  static Future<int> getCacheSize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final index = _loadIndex(prefs);
      return index.values.fold<int>(0, (sum, e) => sum + e.size);
    } catch (_) {
      return 0;
    }
  }

  static void _evictOldest() {
    if (_memoryCache.length <= _maxMemoryEntries) return;
    final entries = _memoryCache.entries.toList()
      ..sort((a, b) => a.value.data.cachedAt.compareTo(b.value.data.cachedAt));
    final toRemove = entries.take(_memoryCache.length - _maxMemoryEntries);
    for (final e in toRemove) {
      _memoryCache.remove(e.key);
    }
  }

  static Map<String, CacheIndex> _loadIndex(SharedPreferences prefs) {
    final raw = prefs.getString('cache_index');
    if (raw == null) return {};
    final map = jsonDecode(raw) as Map<String, dynamic>;
    return map.map((k, v) {
      final entry = v as Map<String, dynamic>;
      return MapEntry(
        k,
        CacheIndex(
          key: entry['key'] as String,
          cachedAt: DateTime.parse(entry['cachedAt'] as String),
          size: entry['size'] as int,
        ),
      );
    });
  }

  static Future<void> _saveIndex(
    SharedPreferences prefs,
    Map<String, CacheIndex> index,
  ) async {
    final map = index.map((k, v) => MapEntry(
          k,
          {
            'key': v.key,
            'cachedAt': v.cachedAt.toIso8601String(),
            'size': v.size,
          },
        ));
    await prefs.setString('cache_index', jsonEncode(map));
  }
}

class _CacheEntry {
  final CacheData data;
  const _CacheEntry({required this.data});
}
