class MangaPage {
  final String imageUrl;
  final int pageIndex;
  final double? width;
  final double? height;

  const MangaPage({
    required this.imageUrl,
    required this.pageIndex,
    this.width,
    this.height,
  });
}
