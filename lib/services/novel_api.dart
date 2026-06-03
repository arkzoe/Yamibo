import '../core/network/dio_client.dart';

class NovelApi {
  NovelApi._();

  static Future<String> getThreadFirstPage(String tid, {int page = 1}) async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'viewthread',
        'version': 1,
        'tid': tid,
        'page': page,
      },
    );
    return resp.data as String;
  }

  static Future<String> getThreadPageByAuthor(
    String tid,
    int page,
    String authorId,
  ) async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'viewthread',
        'version': 1,
        'tid': tid,
        'page': page,
        'authorid': authorId,
      },
    );
    return resp.data as String;
  }
}
