import 'package:html/parser.dart' as html_parser;
import '../models/manga_page.dart';

class MangaHtmlParser {
  MangaHtmlParser._();

  static List<MangaPage> parsePages(String html) {
    final document = html_parser.parse(html);
    final images = <MangaPage>[];
    final seen = <String>{};

    final imgElements = document.querySelectorAll('img');
    for (var i = 0; i < imgElements.length; i++) {
      final img = imgElements[i];
      final src = img.attributes['src'] ??
          img.attributes['file'] ??
          img.attributes['data-src'] ??
          '';
      if (src.isEmpty || seen.contains(src)) continue;
      if (_isFilteredImage(src)) continue;

      seen.add(src);
      final normalized = src.startsWith('//') ? 'https:$src' : src;
      final width = img.attributes['width'] != null
          ? double.tryParse(img.attributes['width']!)
          : null;
      final height = img.attributes['height'] != null
          ? double.tryParse(img.attributes['height']!)
          : null;
      images.add(MangaPage(
        imageUrl: normalized,
        pageIndex: i,
        width: width,
        height: height,
      ));
    }

    return images;
  }

  static String extractTitle(String html) {
    final titleMatch = RegExp(r'<title>([^<]+)').firstMatch(html);
    if (titleMatch != null) {
      return titleMatch.group(1)!.replaceAll(RegExp(r'\s*-\s*.*$'), '').trim();
    }
    final subjectMatch =
        RegExp(r'"subject"\s*:\s*"([^"]+)"').firstMatch(html);
    return subjectMatch?.group(1) ?? '';
  }

  static bool _isFilteredImage(String src) {
    const filters = [
      'smiley',
      'avatar',
      'icon',
      '勋章',
      'star',
      'thumb',
      'common',
      'static/image',
      'template',
      'block',
      'logo',
      'button',
      'bg_.*',
    ];
    return filters.any(src.contains);
  }
}
