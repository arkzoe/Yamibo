import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieManager {
  static const _key = 'yamibo_cookie';
  static String? _cached;

  static Future<String?> load() async {
    if (_cached != null) return _cached;
    final prefs = await SharedPreferences.getInstance();
    _cached = prefs.getString(_key);
    return _cached;
  }

  static void saveSync(String cookie) {
    _cached = cookie;
    SharedPreferences.getInstance().then((prefs) => prefs.setString(_key, cookie));
  }

  static Future<void> save(String cookie) async {
    _cached = cookie;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, cookie);
  }

  static Future<void> clear() async {
    _cached = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class CookieInjectInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final cookie = CookieManager._cached;
    if (cookie != null && cookie.isNotEmpty) {
      options.headers['Cookie'] = cookie;
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final setCookies = response.headers['set-cookie'];
    if (setCookies != null && setCookies.isNotEmpty) {
      CookieManager.saveSync(setCookies.last);
    }
    handler.next(response);
  }
}
