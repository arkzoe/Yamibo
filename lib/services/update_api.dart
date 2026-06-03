import 'package:dio/dio.dart';

class UpdateInfo {
  final String tagName;
  final String body;
  final String apkName;
  final String apkDownloadUrl;

  UpdateInfo({
    required this.tagName,
    required this.body,
    required this.apkName,
    required this.apkDownloadUrl,
  });
}

class UpdateApi {
  UpdateApi._();

  static const String _apiUrl =
      'https://api.github.com/repos/arkzoe/Yamibo/releases/latest';

  static Future<UpdateInfo> checkUpdate({String? token}) async {
    final headers = <String, dynamic>{
      'Accept': 'application/vnd.github.v3+json',
      'User-Agent': 'YamiboReaderPro',
    };
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    final dio = Dio(BaseOptions(headers: headers));
    final resp = await dio.get(_apiUrl);
    final data = resp.data as Map<String, dynamic>;

    final assets = data['assets'] as List;
    final apkAsset = assets.cast<Map<String, dynamic>>().firstWhere(
      (a) => (a['name'] as String).endsWith('.apk'),
      orElse: () => assets.isNotEmpty ? assets[0] as Map<String, dynamic> : <String, dynamic>{},
    );

    return UpdateInfo(
      tagName: data['tag_name'] as String,
      body: data['body'] as String? ?? '',
      apkName: apkAsset['name'] as String? ?? '',
      apkDownloadUrl: apkAsset['browser_download_url'] as String? ?? '',
    );
  }
}
