import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebPage extends StatefulWidget {
  final String url;
  final String? title;
  final bool hideAppBar;

  const WebPage({
    super.key,
    required this.url,
    this.title,
    this.hideAppBar = false,
  });

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  String _pageTitle = '';
  int _progress = 0;
  bool _hasError = false;
  String _errorMessage = '';
  InAppWebViewController? _controller;

  static Future<void> _injectFooterHider(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hideAppBar
          ? null
          : AppBar(
              title: Text(widget.title ?? _pageTitle),
              leading: const BackButton(),
            ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
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
                setState(() => _pageTitle = title);
              }
            },
            onProgressChanged: (controller, progress) {
              setState(() => _progress = progress);
            },
            onLoadStart: (controller, url) async {
              await _injectFooterHider(controller);
            },
            onPageCommitVisible: (controller, url) async {
              await _injectFooterHider(controller);
            },
            onLoadStop: (controller, url) async {
              await _injectFooterHider(controller);
            },
            onUpdateVisitedHistory: (controller, url, isReload) async {
              await _injectFooterHider(controller);
            },
            onReceivedError: (controller, request, error) {
              setState(() {
                _hasError = true;
                _errorMessage = error.description;
              });
            },
          ),
          if (_hasError)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline, size: 64,
                        color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 16),
                    Text('加载失败',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(_errorMessage, textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () {
                        setState(() {
                          _hasError = false;
                          _errorMessage = '';
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
          if (_progress < 100)
            const Center(child: CircularProgressIndicator()),
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
        ],
      ),
    );
  }
}
