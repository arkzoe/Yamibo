import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../../core/network/cookie_manager.dart' as app;
import '../../../shared/widgets/reader_mode_fab.dart';

class BBSPage extends StatefulWidget {
  const BBSPage({super.key});

  @override
  State<BBSPage> createState() => _BBSPageState();
}

class _BBSPageState extends State<BBSPage> {
  String _pageTitle = '';
  String _currentUrl = '';
  int _progress = 0;
  bool _hasError = false;
  bool _showReaderFab = false;
  InAppWebViewController? _controller;

  static const _novelSections = [
    '文學區',
    '文学区',
    '轻小说/译文区',
    'TXT小说区',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: WebUri('https://bbs.yamibo.com')),
            initialSettings: InAppWebViewSettings(
              javaScriptEnabled: true,
              domStorageEnabled: true,
              useWideViewPort: true,
              supportZoom: true,
              mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
            ),
            onWebViewCreated: (controller) => _controller = controller,
            onTitleChanged: (controller, title) {
              if (title != null) {
                setState(() {
                  _pageTitle = title;
                  _updateReaderFab();
                });
              }
            },
            onProgressChanged: (controller, progress) {
              setState(() => _progress = progress);
            },
            onLoadStop: (controller, url) async {
              await _injectFooterHider(controller);
              if (url != null) {
                setState(() {
                  _currentUrl = url.toString();
                  _updateReaderFab();
                });
              }
            },
            onUpdateVisitedHistory: (controller, url, isReload) async {
              await _injectFooterHider(controller);
              if (url != null) {
                setState(() {
                  _currentUrl = url.toString();
                  _updateReaderFab();
                });
              }
            },
            onReceivedError: (controller, request, error) {
              setState(() => _hasError = true);
            },
          ),
          if (_progress > 0 && _progress < 100)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: LinearProgressIndicator(
                value: _progress / 100,
                minHeight: 2,
              ),
            ),
          if (_hasError)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline,
                        size: 64,
                        color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 16),
                    Text('加载失败',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () {
                        setState(() {
                          _hasError = false;
                          _progress = 0;
                        });
                        _controller?.reload();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('重试'),
                    ),
                  ],
                ),
              ),
            ),
          if (_showReaderFab)
            Positioned(
              right: 16,
              bottom: 16,
              child: ReaderModeFab(onTap: _onReaderModeTap),
            ),
        ],
      ),
    );
  }

  void _updateReaderFab() {
    final isThreadPage =
        _currentUrl.contains('mod=viewthread') && _currentUrl.contains('tid=');
    final isNovelSection =
        _novelSections.any((s) => _pageTitle.contains(s));
    _showReaderFab = isThreadPage && isNovelSection;
  }

  Future<void> _onReaderModeTap() async {
    final tidMatch = RegExp(r'tid=(\d+)').firstMatch(_currentUrl);
    if (tidMatch != null) {
      final webCookies = await CookieManager.instance()
          .getCookies(url: WebUri('https://bbs.yamibo.com'));
      if (webCookies.isNotEmpty) {
        final cookieStr =
            webCookies.map((c) => '${c.name}=${c.value}').join('; ');
        await app.CookieManager.save(cookieStr);
      }
      // Optionally carry over authorid from URL (e.g. "只看楼主" mode).
      final authorIdMatch = RegExp(r'authorid=(\d+)').firstMatch(_currentUrl);
      final authorIdParam = authorIdMatch != null
          ? '?authorId=${authorIdMatch.group(1)}'
          : '';
      if (mounted) {
        context.push('/reader/${tidMatch.group(1)}$authorIdParam');
      }
    }
  }

  Future<void> _injectFooterHider(
      InAppWebViewController controller) async {
    await controller.evaluateJavascript(source: '''
      (function() {
        var css = '.foot.flex-box:not(.foot_reply){display:none!important}' +
          '.foot_height{display:none!important}';
        var id = 'yamibo-hide-style';
        if (document.getElementById(id)) return;
        var s = document.createElement('style');
        s.id = id;
        function tryInject() {
          var target = document.head || document.documentElement;
          if (target) {
            target.appendChild(s);
            s.innerHTML = css;
          } else {
            setTimeout(tryInject, 50);
          }
        }
        tryInject();
        if (document.body) {
          var mo = new MutationObserver(function() {
            if (!document.getElementById(id)) tryInject();
          });
          mo.observe(document.body, {childList:true, subtree:true});
        } else {
          document.addEventListener('DOMContentLoaded', function() {
            var mo = new MutationObserver(function() {
              if (!document.getElementById(id)) tryInject();
            });
            mo.observe(document.body, {childList:true, subtree:true});
          });
        }
      })();
    ''');
  }
}
