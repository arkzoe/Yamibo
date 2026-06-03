import '../core/network/dio_client.dart';

class MangaApi {
  MangaApi._();

  static Future<String> getTagPageHtml(String tagId, {int page = 1}) async {
    final resp = await DioClient.dio.get(
      '/misc.php',
      queryParameters: {
        'mod': 'tag',
        'type': 'thread',
        'mobile': 'no',
        'id': tagId,
        'page': page,
      },
    );
    return resp.data as String;
  }

  static Future<String> searchForum({
    String fid = '30',
    required String keyword,
    String srchtype = 'title',
  }) async {
    final resp = await DioClient.dio.get(
      '/search.php',
      queryParameters: {
        'mod': 'forum',
        'searchsubmit': 'yes',
        'mobile': 2,
        'srchfid[]': fid,
        'srchtxt': keyword,
        'srchtype': srchtype,
      },
    );
    return resp.data as String;
  }

  static Future<String> searchForumPage(
    String searchId,
    int page,
  ) async {
    final resp = await DioClient.dio.get(
      '/search.php',
      queryParameters: {
        'mod': 'forum',
        'orderby': 'dateline',
        'ascdesc': 'desc',
        'searchsubmit': 'yes',
        'mobile': 2,
        'searchid': searchId,
        'page': page,
      },
    );
    return resp.data as String;
  }

  static Future<String> getThreadDetailApi(String tid, {int page = 1}) async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'viewthread',
        'version': 4,
        'tid': tid,
        'page': page,
      },
    );
    return resp.data as String;
  }
}
