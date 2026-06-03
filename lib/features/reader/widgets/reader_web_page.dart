import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class ReaderWebPage extends StatelessWidget {
  final String url;

  const ReaderWebPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return WebPage(url: url, title: '阅读');
  }
}
