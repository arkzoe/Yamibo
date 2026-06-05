import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'content_prober.dart';

class ProbingPage extends ConsumerStatefulWidget {
  final String url;
  final String? favoriteId;

  const ProbingPage({
    super.key,
    required this.url,
    this.favoriteId,
  });

  @override
  ConsumerState<ProbingPage> createState() => _ProbingPageState();
}

class _ProbingPageState extends ConsumerState<ProbingPage> {
  @override
  void initState() {
    super.initState();
    _probeAndNavigate();
  }

  Future<void> _probeAndNavigate() async {
    final result = await ContentProber.probe(widget.url);

    if (!mounted) return;

    switch (result.type) {
      case 1:
        context.push(
            '/reader/${result.tid}?authorId=${Uri.encodeComponent(result.authorId)}&title=${Uri.encodeComponent(result.title)}');
      case 2:
        context.push(
            '/manga?url=${Uri.encodeComponent(widget.url)}');
      default:
        context.push(
            '/other?url=${Uri.encodeComponent(widget.url)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(
              '正在识别内容类型...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
