class RequestConfig {
  RequestConfig._();

  static const String baseUrl = 'https://bbs.yamibo.com';
  static const String apiPath = '/api/mobile/index.php';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration imageReceiveTimeout = Duration(seconds: 30);

  static const String userAgent =
      'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 '
      '(KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36';

  static const int imageRateLimitMs = 100;
}
