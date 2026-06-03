import 'package:dio/dio.dart';

class RateLimitInterceptor extends Interceptor {
  final int minIntervalMs;
  int _lastRequestTime = 0;

  RateLimitInterceptor(this.minIntervalMs);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final elapsed = now - _lastRequestTime;
    if (elapsed < minIntervalMs) {
      Future.delayed(Duration(milliseconds: minIntervalMs - elapsed), () {
        _lastRequestTime = DateTime.now().millisecondsSinceEpoch;
        handler.next(options);
      });
    } else {
      _lastRequestTime = now;
      handler.next(options);
    }
  }
}
