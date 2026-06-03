import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/favorite.dart';

class FavoriteStorage {
  FavoriteStorage._();

  static const _key = 'favorites';

  static Future<List<FavoriteItem>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List;
    return list.map((e) => FavoriteItem.fromJson(e as Map<String, dynamic>)).toList();
  }

  static Future<void> save(List<FavoriteItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_key, raw);
  }
}
