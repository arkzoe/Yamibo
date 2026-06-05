import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ReadProgress {
  final double scrollOffset;
  final int currentChapterIndex;
  final int currentPage;
  final String tid;

  const ReadProgress({
    required this.tid,
    this.scrollOffset = 0.0,
    this.currentChapterIndex = 0,
    this.currentPage = 1,
  });

  Map<String, dynamic> toJson() => {
        'tid': tid,
        'scrollOffset': scrollOffset,
        'currentChapterIndex': currentChapterIndex,
        'currentPage': currentPage,
      };

  factory ReadProgress.fromJson(Map<String, dynamic> json) => ReadProgress(
        tid: json['tid'] as String,
        scrollOffset: (json['scrollOffset'] as num?)?.toDouble() ?? 0.0,
        currentChapterIndex:
            (json['currentChapterIndex'] as num?)?.toInt() ?? 0,
        currentPage: (json['currentPage'] as num?)?.toInt() ?? 1,
      );
}

class ReadProgressStorage {
  ReadProgressStorage._();

  static const _prefix = 'read_progress_';

  static Future<ReadProgress?> load(String tid) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('$_prefix$tid');
    if (raw == null) return null;
    try {
      return ReadProgress.fromJson(
          jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  static Future<void> save(ReadProgress progress) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$_prefix${progress.tid}',
      jsonEncode(progress.toJson()),
    );
  }

  static Future<void> remove(String tid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('$_prefix$tid');
  }
}
