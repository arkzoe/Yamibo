import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class BBSPage extends StatelessWidget {
  const BBSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebPage(url: 'https://bbs.yamibo.com', title: '论坛');
  }
}
