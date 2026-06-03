import 'package:dio/dio.dart';
import 'dns_resolver.dart';
import 'cookie_manager.dart';
import 'rate_limiter.dart';
import 'image_checker.dart';

class DioClient {
  static const String baseUrl = 'https://bbs.yamibo.com';

  static late final Dio dio;
  static late final Dio imageDio;
  static final RacingDnsResolver dnsResolver = RacingDnsResolver();

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));
    dio.interceptors.addAll([
      CookieInjectInterceptor(),
      UserAgentInterceptor(),
      RefererInterceptor(),
    ]);

    imageDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
    ));
    imageDio.interceptors.addAll([
      CookieInjectInterceptor(),
      UserAgentInterceptor(),
      RefererInterceptor(),
      RateLimitInterceptor(100),
      ImageCheckInterceptor(),
    ]);
  }
}

class UserAgentInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] =
        'Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 '
        '(KHTML, like Gecko) Chrome/120.0.6099.144 Mobile Safari/537.36';
    handler.next(options);
  }
}

class RefererInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Referer'] = 'https://bbs.yamibo.com';
    options.headers['Accept-Language'] = 'zh-CN';
    handler.next(options);
  }
}
