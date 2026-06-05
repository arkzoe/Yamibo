import 'dart:convert';
import 'package:dio/dio.dart';
import '../core/network/dio_client.dart';

class NovelApi {
  NovelApi._();

  /// Fetch thread metadata (authorId, title, maxPage) via API v1.
  /// Returns the parsed JSON object. Used to resolve authorId before loading content.
  static Future<Map<String, dynamic>> getThreadMeta(String tid) async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'viewthread',
        'version': 1,
        'tid': tid,
        'page': 1,
      },
      options: Options(responseType: ResponseType.plain),
    );
    return jsonDecode(resp.data as String) as Map<String, dynamic>;
  }

  /// Fetch thread content via API v4 with optional [authorId] filter.
  /// v4 returns HTML with embedded JSON, which HtmlParser expects.
  /// When authorId is provided, server may additionally filter by author.
  static Future<String> probeThread(String tid, {int page = 1, String? authorId}) async {
    final query = <String, dynamic>{
      'module': 'viewthread',
      'version': 4,
      'tid': tid,
      'page': page,
    };
    if (authorId != null && authorId.isNotEmpty) {
      query['authorid'] = authorId;
    }
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: query,
      options: Options(responseType: ResponseType.plain),
    );
    return resp.data as String;
  }

  /// Fetch thread page HTML with optional [authorId] filter.
  static Future<String> getThreadContent(
    String tid, {
    int page = 1,
    String? authorId,
  }) async {
    final query = <String, dynamic>{
      'mod': 'viewthread',
      'tid': tid,
      'page': page,
      'mobile': 2,
    };
    if (authorId != null && authorId.isNotEmpty) {
      query['authorid'] = authorId;
    }
    final resp = await DioClient.dio.get('/forum.php', queryParameters: query);
    return resp.data as String;
  }
}
