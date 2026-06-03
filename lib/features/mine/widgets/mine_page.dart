import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebPage(
      url:
          'https://bbs.yamibo.com/home.php?mod=space&do=profile&mycenter=1&mobile=2',
      title: '我的',
    );
  }
}
