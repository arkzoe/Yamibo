import '../core/network/dio_client.dart';

class SignApi {
  SignApi._();

  static Future<String> fetchHtml(String url) async {
    final resp = await DioClient.dio.get(url);
    return resp.data as String;
  }
}
