import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class OtherWebPage extends StatelessWidget {
  final String url;

  const OtherWebPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return WebPage(url: url, title: '浏览');
  }
}
