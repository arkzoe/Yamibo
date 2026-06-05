import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../probe/content_prober.dart';
import 'reader_page.dart';

class ReaderWebPage extends StatelessWidget {
  final String url;

  const ReaderWebPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final tid = ContentProber.extractTid(url);
    if (tid != null) {
      return ReaderPage(tid: tid);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.pop();
    });
    return const Scaffold(
      body: Center(child: Text('无效的链接')),
    );
  }
}
