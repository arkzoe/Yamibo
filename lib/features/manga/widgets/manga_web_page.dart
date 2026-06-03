import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class MangaWebPage extends StatelessWidget {
  final String url;

  const MangaWebPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return WebPage(url: url, title: '漫画');
  }
}
