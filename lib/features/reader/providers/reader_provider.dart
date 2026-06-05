import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/cache/disk_cache.dart';
import '../../../core/models/cache_data.dart';
import '../../../core/models/content.dart';
import '../../../services/novel_api.dart';
import '../models/chapter_info.dart';
import '../models/reader_state.dart';
import '../utils/html_parser.dart';
import '../utils/read_progress_storage.dart';

final readerProvider =
    AsyncNotifierProvider<ReaderNotifier, ReaderState>(ReaderNotifier.new);

class ReaderNotifier extends AsyncNotifier<ReaderState> {
  Timer? _progressTimer;
  Map<String, String>? _tocTitleMap;

  @override
  Future<ReaderState> build() async {
    ref.onDispose(() {
      _progressTimer?.cancel();
    });
    return ReaderState(tid: '', isLoading: true);
  }

  Future<void> load({
    required String tid,
    String? authorId,
    String? title,
    int? page,
  }) async {
    state = AsyncValue.data(ReaderState(
      tid: tid,
      authorId: authorId ?? '',
      chapterTitle: title ?? '',
      isLoading: true,
    ));

    try {
      final progress = await ReadProgressStorage.load(tid);
      final startPage = page ?? progress?.currentPage ?? 1;

      final cacheKey = '${tid}_$startPage';
      final cached = await DiskCache.get(cacheKey);

      if (cached != null) {
        final allContents = <Content>[];
        final pageChapters = <ChapterInfo>[];
        for (final post in cached.posts) {
          allContents.addAll(post.contents);
          if (post.chapterTitle.isNotEmpty) {
            pageChapters.add(ChapterInfo(
              tid: tid,
              title: post.chapterTitle,
              page: startPage,
              authorId: post.authorId,
              index: pageChapters.length,
              postIndex: post.postIndex,
            ));
          }
        }

        final cachedAuthorId = authorId?.isNotEmpty == true
            ? authorId!
            : (pageChapters.isNotEmpty ? pageChapters.first.authorId : '');

        state = AsyncValue.data(ReaderState(
          tid: tid,
          authorId: cachedAuthorId,
          chapterTitle: pageChapters.isNotEmpty ? pageChapters.first.title : (title ?? ''),
          contents: allContents,
          currentPage: startPage,
          maxPageNum: cached.maxPageNum,
          chapters: pageChapters,
          scrollOffset: progress?.scrollOffset ?? 0.0,
          currentChapterIndex: progress?.currentChapterIndex ?? 0,
          isLoading: false,
        ));

        _startProgressTimer(tid);
        _fetchChapters(tid, authorId: cachedAuthorId.isNotEmpty ? cachedAuthorId : null);
        return;
      }

      final html = await NovelApi.probeThread(tid, page: startPage, authorId: authorId);

      // Extract authorId from the response's postlist JSON.
      // In Discuz, the first post is always the thread starter.
      final resolvedAuthorId = (authorId != null && authorId.isNotEmpty)
          ? authorId
          : HtmlParser.extractAuthorIdFromHtml(html);

      _tocTitleMap ??= HtmlParser.extractTocFromPage(html);

      final maxPageNum = HtmlParser.extractMaxPageNum(html);

      final result = HtmlParser.parsePageContent(
        html: html,
        tid: tid,
        authorId: resolvedAuthorId.isNotEmpty ? resolvedAuthorId : null,
        tocTitleMap: _tocTitleMap,
      );

      final chapterTitle = result.chapters.isNotEmpty
          ? result.chapters.first.title
          : (title ?? '');

      final postMap = <int, List<Content>>{};
      for (final c in result.contents) {
        postMap.putIfAbsent(c.postIndex, () => []).add(c);
      }

      final postCacheList = postMap.entries.map((e) {
        final contents = e.value;
        final postAuthorId = contents.isNotEmpty ? contents.first.authorId : '';
        final ch = result.chapters.where((ch) => ch.postIndex == e.key).firstOrNull;
        return PostCacheData(
          postIndex: e.key,
          authorId: postAuthorId,
          contents: contents,
          chapterTitle: ch?.title ?? '',
        );
      }).toList();

      await DiskCache.put(
        cacheKey,
        CacheData(
          key: cacheKey,
          posts: postCacheList,
          maxPageNum: maxPageNum,
          cachedAt: DateTime.now(),
        ),
      );

      state = AsyncValue.data(ReaderState(
        tid: tid,
        authorId: resolvedAuthorId,
        chapterTitle: chapterTitle,
        contents: result.contents,
        chapters: result.chapters,
        currentPage: startPage,
        maxPageNum: maxPageNum,
        scrollOffset: progress?.scrollOffset ?? 0.0,
        currentChapterIndex: progress?.currentChapterIndex ?? 0,
        isLoading: false,
      ));

      _startProgressTimer(tid);
      _fetchChapters(tid, authorId: resolvedAuthorId.isNotEmpty ? resolvedAuthorId : null);
    } catch (e) {
      state = AsyncValue.data(
        (state.asData?.value ?? ReaderState(tid: tid)).copyWith(
          tid: tid,
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadPage(int page) async {
    final s = state.asData?.value;
    if (s == null || s.tid.isEmpty) return;

    await load(
      tid: s.tid,
      authorId: s.authorId.isNotEmpty ? s.authorId : null,
      page: page,
    );
  }

  Future<void> refresh() async {
    final s = state.asData?.value;
    if (s == null || s.tid.isEmpty) return;

    final cacheKey = '${s.tid}_${s.currentPage}';
    await DiskCache.remove(cacheKey);
    await load(
      tid: s.tid,
      authorId: s.authorId.isNotEmpty ? s.authorId : null,
      page: s.currentPage,
    );
  }

  Future<void> navigateToChapter(int index) async {
    final s = state.asData?.value;
    if (s == null) return;
    if (index < 0 || index >= s.chapters.length) return;

    final chapter = s.chapters[index];
    state = AsyncValue.data(s.copyWith(
      currentChapterIndex: index,
      currentPostIndex: chapter.postIndex,
    ));

    if (chapter.page != s.currentPage) {
      await loadPage(chapter.page);
    }
  }

  void updateScrollOffset(double offset) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(scrollOffset: offset));
  }

  void setFontSize(double size) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(fontSize: size));
  }

  void setLineHeight(double height) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(lineHeight: height));
  }

  void setLetterSpacing(double spacing) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(letterSpacing: spacing));
  }

  void setPadding(double padding) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(padding: padding));
  }

  void toggleNightMode() {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(nightMode: !s.nightMode));
  }

  void setLoadImages(bool value) {
    final s = state.asData?.value;
    if (s == null) return;
    state = AsyncValue.data(s.copyWith(loadImages: value));
  }

  void _startProgressTimer(String tid) {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      final s = state.asData?.value;
      if (s == null || s.tid.isEmpty) return;

      ReadProgressStorage.save(ReadProgress(
        tid: s.tid,
        scrollOffset: s.scrollOffset,
        currentChapterIndex: s.currentChapterIndex,
        currentPage: s.currentPage,
      ));
    });
  }

  Future<void> _fetchChapters(String tid, {String? authorId}) async {
    try {
      final resolvedAuthorId = authorId?.isNotEmpty == true
          ? authorId
          : (state.asData?.value.authorId.isNotEmpty == true
              ? state.asData!.value.authorId
              : null);

      final html = await NovelApi.probeThread(tid, authorId: resolvedAuthorId);
      final maxPage = HtmlParser.extractMaxPageNum(html);

      _tocTitleMap ??= HtmlParser.extractTocFromPage(html);

      final allChapters = <ChapterInfo>[];

      for (int page = 1; page <= maxPage; page++) {
        final pageHtml = page == 1
            ? html
            : await NovelApi.probeThread(tid, page: page, authorId: resolvedAuthorId);
        final chapters = HtmlParser.parseChaptersFromPage(
          html: pageHtml,
          tid: tid,
          authorId: resolvedAuthorId,
          tocTitleMap: _tocTitleMap,
        );
        allChapters.addAll(chapters);
      }

      for (int i = 0; i < allChapters.length; i++) {
        allChapters[i] = allChapters[i].copyWith(index: i);
      }

      final s = state.asData?.value;
      if (s != null && allChapters.isNotEmpty) {
        state = AsyncValue.data(s.copyWith(chapters: allChapters));
      }
    } catch (_) {}
  }
}
