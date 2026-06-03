import 'package:dio/dio.dart';

import '../core/network/dio_client.dart';

class FavoriteApi {
  FavoriteApi._();

  static Future<String> getMyFavThread(int page) async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'myfavthread',
        'version': 1,
        'page': page,
      },
    );
    return resp.data as String;
  }

  static Future<String> getFormHash() async {
    final resp = await DioClient.dio.get(
      '/api/mobile/index.php',
      queryParameters: {
        'module': 'profile',
        'version': 4,
      },
    );
    return resp.data as String;
  }

  static Future<String> deleteFavorites(
    String formhash,
    List<String> deleteIds,
  ) async {
    final resp = await DioClient.dio.post(
      '/home.php',
      queryParameters: {
        'mod': 'spacecp',
        'ac': 'favorite',
        'op': 'delete',
        'type': 'all',
        'checkall': 1,
      },
      data: FormData.fromMap({
        'formhash': formhash,
        'deleteids[]': deleteIds,
        'deletesubmit': true,
      }),
    );
    return resp.data as String;
  }
}
