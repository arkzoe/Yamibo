import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/reader_provider.dart';
import '../models/reader_state.dart';
import 'content_viewer.dart';
import 'settings_panel.dart';

class ReaderPage extends ConsumerStatefulWidget {
  final String tid;
  final String? authorId;
  final String? title;

  const ReaderPage({
    super.key,
    required this.tid,
    this.authorId,
    this.title,
  });

  @override
  ConsumerState<ReaderPage> createState() => _ReaderPageState();
}

class _ReaderPageState extends ConsumerState<ReaderPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _postKeys = {};
  bool _showSettings = false;
  int _lastPostIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(readerProvider.notifier).load(
            tid: widget.tid,
            authorId: widget.authorId,
            title: widget.title,
          );
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final notifier = ref.read(readerProvider.notifier);
    notifier.updateScrollOffset(_scrollController.offset);
  }

  void _restoreScrollPosition(double offset) {
    if (offset > 0 && _scrollController.hasClients) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(offset.clamp(
            0,
            _scrollController.position.maxScrollExtent,
          ));
        }
      });
    }
  }

  void _scrollToPostIndex(int targetPostIndex) {
    final key = _postKeys[targetPostIndex];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 300),
        alignment: 0.1,
      );
    }
    _lastPostIndex = targetPostIndex;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(readerProvider, (prev, next) {
      final prevValue = prev?.asData?.value;
      final nextValue = next.asData?.value;
      if (nextValue == null || nextValue.isLoading) return;

      final contentChanged = prevValue == null ||
          prevValue.contents != nextValue.contents ||
          prevValue.currentPage != nextValue.currentPage;

      final chapterNav = nextValue.currentPostIndex != _lastPostIndex;

      if (contentChanged || chapterNav) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (chapterNav && nextValue.currentPostIndex >= 0) {
            _scrollToPostIndex(nextValue.currentPostIndex);
          } else if (contentChanged) {
            _restoreScrollPosition(nextValue.scrollOffset);
          }
        });
      }
    });

    final stateAsync = ref.watch(readerProvider);
    final notifier = ref.read(readerProvider.notifier);

    return stateAsync.when(
      loading: () => _buildScaffold(
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => _buildScaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(err.toString(), textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => notifier.refresh(),
                icon: const Icon(Icons.refresh),
                label: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
      data: (state) {
        if (state.isLoading) {
          return _buildScaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.tid.isEmpty) {
          return _buildScaffold(
            body: const Center(child: Text('未加载')),
          );
        }

        if (state.isError) {
          return _buildScaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 64,
                      color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage.isNotEmpty
                        ? state.errorMessage
                        : '加载失败',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => notifier.refresh(),
                    icon: const Icon(Icons.refresh),
                    label: const Text('重试'),
                  ),
                ],
              ),
            ),
          );
        }

        if (state.contents.isEmpty) {
          return _buildScaffold(
            body: const Center(child: Text('暂无内容')),
          );
        }

        return _buildScaffold(
          appBar: AppBar(
            title: Text(
              state.chapterTitle.isNotEmpty
                  ? state.chapterTitle
                  : '阅读',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              if (state.maxPageNum > 1)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Center(
                    child: Text(
                      '${state.currentPage}/${state.maxPageNum}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              if (state.chapters.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.list),
                  tooltip: '目录',
                  onPressed: () => _showTocSheet(state, notifier),
                ),
              IconButton(
                icon: Icon(
                  state.nightMode ? Icons.light_mode : Icons.dark_mode,
                ),
                onPressed: () => notifier.toggleNightMode(),
              ),
              IconButton(
                icon: const Icon(Icons.text_fields),
                onPressed: () {
                  setState(() => _showSettings = !_showSettings);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              if (_showSettings)
                SettingsPanel(
                  fontSize: state.fontSize,
                  lineHeight: state.lineHeight,
                  letterSpacing: state.letterSpacing,
                  padding: state.padding,
                  nightMode: state.nightMode,
                  loadImages: state.loadImages,
                  onFontSizeChanged: notifier.setFontSize,
                  onLineHeightChanged: notifier.setLineHeight,
                  onLetterSpacingChanged: notifier.setLetterSpacing,
                  onPaddingChanged: notifier.setPadding,
                  onToggleNightMode: notifier.toggleNightMode,
                  onLoadImagesChanged: notifier.setLoadImages,
                ),
              Expanded(
                child: _buildContentList(state),
              ),
              if (state.maxPageNum > 1)
                _buildPageNav(state, notifier),
            ],
          ),
        );
      },
    );
  }

  void _showTocSheet(ReaderState state, ReaderNotifier notifier) {
    showModalBottomSheet(
      context: context,
      backgroundColor: state.nightMode ? const Color(0xFF1E1E1E) : Colors.white,
      builder: (ctx) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.list, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    '目录',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: state.nightMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${state.chapters.length} 章',
                    style: TextStyle(
                      fontSize: 13,
                      color: state.nightMode ? Colors.grey[400] : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.chapters.length,
                itemBuilder: (context, index) {
                  final chapter = state.chapters[index];
                  final isCurrent = index == state.currentChapterIndex;
                  final isNight = state.nightMode;

                  return ListTile(
                    selected: isCurrent,
                    selectedTileColor: isNight
                        ? Colors.blueGrey.withValues(alpha: 0.3)
                        : Colors.blue.withValues(alpha: 0.1),
                    leading: Container(
                      width: 28,
                      height: 28,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? Theme.of(context).colorScheme.primary
                            : (isNight ? Colors.grey[700] : Colors.grey[300]),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isCurrent ? Colors.white : (isNight ? Colors.white70 : Colors.black87),
                        ),
                      ),
                    ),
                    title: Text(
                      chapter.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                        color: isNight ? Colors.white : Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      '第 ${chapter.page} 页',
                      style: TextStyle(
                        fontSize: 12,
                        color: isNight ? Colors.grey[500] : Colors.grey[600],
                      ),
                    ),
                    trailing: isCurrent
                        ? Icon(Icons.check, size: 18, color: Theme.of(context).colorScheme.primary)
                        : null,
                    onTap: () {
                      Navigator.pop(ctx);
                      notifier.navigateToChapter(index);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContentList(ReaderState state) {
    _postKeys.clear();
    for (int i = 0; i < state.contents.length; i++) {
      final isFirstInPost = i == 0 || state.contents[i].postIndex != state.contents[i - 1].postIndex;
      if (isFirstInPost) {
        _postKeys[state.contents[i].postIndex] = GlobalKey();
      }
    }

    final bgColor = state.nightMode ? const Color(0xFF121212) : Colors.white;

    return Container(
      color: bgColor,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: state.contents.length,
        itemBuilder: (context, index) {
          final content = state.contents[index];
          final isFirstInPost = index == 0 || state.contents[index].postIndex != state.contents[index - 1].postIndex;
          final key = isFirstInPost ? _postKeys[content.postIndex] : null;

          Widget child = ContentViewer(
            content: content,
            fontSize: state.fontSize,
            lineHeight: state.lineHeight,
            letterSpacing: state.letterSpacing,
            padding: state.padding,
            nightMode: state.nightMode,
            loadImages: state.loadImages,
          );

          if (key != null) {
            child = Container(key: key, child: child);
          }

          return child;
        },
      ),
    );
  }

  Widget _buildPageNav(ReaderState state, ReaderNotifier notifier) {
    return Container(
      color: state.nightMode ? const Color(0xFF1E1E1E) : Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: state.currentPage > 1
                ? () => notifier.loadPage(state.currentPage - 1)
                : null,
          ),
          Text(
            '${state.currentPage} / ${state.maxPageNum}',
            style: const TextStyle(fontSize: 14),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: state.currentPage < state.maxPageNum
                ? () => notifier.loadPage(state.currentPage + 1)
                : null,
          ),
        ],
      ),
    );
  }

  Scaffold _buildScaffold({
    PreferredSizeWidget? appBar,
    required Widget body,
  }) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            leading: const BackButton(),
            title: const Text('阅读'),
          ),
      body: body,
    );
  }
}
