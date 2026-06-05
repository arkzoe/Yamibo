import 'dart:async';
import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../models/manga_page.dart';

class MangaImagePipeline {
  MangaImagePipeline._();

  static const int _prefetchCount = 5;

  static Future<void> prefetchPages(List<MangaPage> pages,
      {int startIndex = 0}) async {
    final end = (startIndex + _prefetchCount).clamp(0, pages.length);
    final toPrefetch = pages.sublist(startIndex, end);
    final urls = toPrefetch.map((p) => p.imageUrl).toList();
    if (urls.isEmpty) return;

    await Future.wait(
      urls.map(_prefetchImage),
      eagerError: false,
    );
  }

  static Future<void> _prefetchImage(String url) async {
    try {
      await DioClient.imageDio.get(url,
          options: Options(
            responseType: ResponseType.bytes,
            receiveTimeout: const Duration(seconds: 10),
          ));
    } catch (_) {}
  }

  static void cancelPrefetch() {}
}
