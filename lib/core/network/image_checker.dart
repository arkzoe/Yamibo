import 'package:dio/dio.dart';

class ImageCheckInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final contentType = response.headers.value('content-type') ?? '';
    if (!contentType.startsWith('image/')) {
      handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: 'Non-image response: $contentType',
        type: DioExceptionType.badResponse,
      ));
      return;
    }
    handler.next(response);
  }
}
