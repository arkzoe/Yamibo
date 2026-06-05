import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/manga_page.dart';
import '../providers/manga_reader_provider.dart';
import 'manga_settings_panel.dart';
import 'manga_chapter_panel.dart';

class NativeMangaPage extends ConsumerStatefulWidget {
  final String url;

  const NativeMangaPage({super.key, required this.url});

  @override
  ConsumerState<NativeMangaPage> createState() => _NativeMangaPageState();
}

class _NativeMangaPageState extends ConsumerState<NativeMangaPage> {
  final PageController _pageController = PageController();
  bool _showSettings = false;
  bool _showUI = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mangaReaderProvider.notifier).load(widget.url);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mangaReaderProvider);
    final notifier = ref.read(mangaReaderProvider.notifier);

    if (state.isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('漫画')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (state.isError) {
      return Scaffold(
        appBar: AppBar(title: const Text('漫画')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(state.errorMessage, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => notifier.load(state.url),
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      );
    }

    final chapter = state.chapter;
    if (chapter == null || chapter.pages.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('漫画')),
        body: const Center(child: Text('暂无内容')),
      );
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () => setState(() => _showUI = !_showUI),
        child: Stack(
          children: [
            _buildReader(state, chapter.pages),
            if (_showUI) ...[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildAppBar(context, state, chapter.pages.length),
              ),
              if (_showSettings)
                Positioned(
                  top: kToolbarHeight,
                  left: 0,
                  right: 0,
                  child: Material(
                    child: MangaSettingsPanel(
                      readingMode: state.readingMode,
                      fitWidth: state.fitWidth,
                      onReadingModeChanged: (mode) {
                        notifier.setReadingMode(mode);
                        setState(() => _showSettings = false);
                      },
                      onToggleFitWidth: notifier.toggleFitWidth,
                    ),
                  ),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Material(
                  child: MangaChapterPanel(
                    chapter: chapter,
                    currentPageIndex: state.currentPageIndex,
                    onPageSelected: (index) {
                      notifier.goToPage(index);
                      if (state.readingMode != 0) {
                        _pageController.jumpToPage(index);
                      }
                    },
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(
      BuildContext context, MangaReaderState state, int totalPages) {
    return AppBar(
      backgroundColor: Colors.black87,
      foregroundColor: Colors.white,
      elevation: 0,
      title: Text(
        '${state.currentPageIndex + 1} / $totalPages',
        style: const TextStyle(fontSize: 14),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.text_fields),
          onPressed: () => setState(() => _showSettings = !_showSettings),
        ),
      ],
    );
  }

  Widget _buildReader(MangaReaderState state, List<MangaPage> pages) {
    switch (state.readingMode) {
      case 0:
        return _buildScrollMode(state, pages);
      case 1:
        return _buildPageViewMode(state, pages, false);
      case 2:
        return _buildPageViewMode(state, pages, true);
      default:
        return _buildScrollMode(state, pages);
    }
  }

  Widget _buildScrollMode(MangaReaderState state, List<MangaPage> pages) {
    return Container(
      color: Colors.black,
      child: InteractiveViewer(
        child: ListView.builder(
          itemCount: pages.length,
          itemBuilder: (context, index) {
            return _buildMangaImage(pages[index].imageUrl, state.fitWidth,
                pages[index].width, pages[index].height);
          },
        ),
      ),
    );
  }

  Widget _buildPageViewMode(
      MangaReaderState state, List<MangaPage> pages, bool reverse) {
    return Container(
      color: Colors.black,
      child: PageView.builder(
        controller: _pageController,
        reverse: reverse,
        itemCount: pages.length,
        onPageChanged: (index) {
          state.copyWith(currentPageIndex: index);
          ref.read(mangaReaderProvider.notifier).goToPage(index);
        },
        itemBuilder: (context, index) {
          return InteractiveViewer(
            child: _buildMangaImage(pages[index].imageUrl, state.fitWidth,
                pages[index].width, pages[index].height),
          );
        },
      ),
    );
  }

  Widget _buildMangaImage(
      String imageUrl, bool fitWidth, double? width, double? height) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fitWidth ? BoxFit.contain : BoxFit.fitWidth,
          placeholder: (context, url) => const AspectRatio(
          aspectRatio: 3 / 4,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (context, url, error) => Container(
          color: Colors.grey[900],
          height: 200,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey, size: 48),
          ),
        ),
      ),
    );
  }
}
