import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../services/manga_api.dart';
import '../models/manga_chapter.dart';
import '../utils/manga_html_parser.dart';
import '../utils/manga_image_pipeline.dart';

class MangaReaderState {
  final String url;
  final MangaChapter? chapter;
  final int currentPageIndex;
  final int readingMode;
  final bool fitWidth;
  final bool isLoading;
  final bool isError;
  final String errorMessage;

  const MangaReaderState({
    this.url = '',
    this.chapter,
    this.currentPageIndex = 0,
    this.readingMode = 0,
    this.fitWidth = false,
    this.isLoading = false,
    this.isError = false,
    this.errorMessage = '',
  });

  MangaReaderState copyWith({
    String? url,
    MangaChapter? chapter,
    int? currentPageIndex,
    int? readingMode,
    bool? fitWidth,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
  }) {
    return MangaReaderState(
      url: url ?? this.url,
      chapter: chapter ?? this.chapter,
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      readingMode: readingMode ?? this.readingMode,
      fitWidth: fitWidth ?? this.fitWidth,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class MangaReaderNotifier extends Notifier<MangaReaderState> {
  @override
  MangaReaderState build() => const MangaReaderState();

  Future<void> load(String url) async {
    state = MangaReaderState(url: url, isLoading: true);

    try {
      final html = await MangaApi.getThreadDetailApi(_extractTid(url));
      final pages = MangaHtmlParser.parsePages(html);
      final title = MangaHtmlParser.extractTitle(html);

      final chapter = MangaChapter(
        tid: _extractTid(url),
        title: title,
        pages: pages,
      );

      state = MangaReaderState(
        url: url,
        chapter: chapter,
        isLoading: false,
      );

      MangaImagePipeline.prefetchPages(pages);
    } catch (e) {
      state = MangaReaderState(
        url: url,
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  void goToPage(int index) {
    final chapter = state.chapter;
    if (chapter == null) return;
    final clamped = index.clamp(0, chapter.pageCount - 1);
    state = state.copyWith(currentPageIndex: clamped);
    MangaImagePipeline.prefetchPages(chapter.pages, startIndex: clamped);
  }

  void nextPage() => goToPage(state.currentPageIndex + 1);
  void previousPage() => goToPage(state.currentPageIndex - 1);

  void setReadingMode(int mode) {
    state = state.copyWith(readingMode: mode);
  }

  void toggleFitWidth() {
    state = state.copyWith(fitWidth: !state.fitWidth);
  }

  String _extractTid(String url) {
    final tidMatch = RegExp(r'tid=(\d+)').firstMatch(url);
    if (tidMatch != null) return tidMatch.group(1)!;
    final threadMatch = RegExp(r'thread-(\d+)-').firstMatch(url);
    return threadMatch?.group(1) ?? '';
  }
}

final mangaReaderProvider =
    NotifierProvider<MangaReaderNotifier, MangaReaderState>(
  MangaReaderNotifier.new,
);
