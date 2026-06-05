import 'manga_page.dart';

class MangaChapter {
  final String tid;
  final String title;
  final List<MangaPage> pages;

  const MangaChapter({
    required this.tid,
    required this.title,
    required this.pages,
  });

  int get pageCount => pages.length;
}
