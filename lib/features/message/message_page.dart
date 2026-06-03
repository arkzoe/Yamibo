import 'package:flutter/material.dart';
import '../../../shared/widgets/web_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WebPage(
      url: 'https://bbs.yamibo.com/home.php?mod=space&do=pm&mobile=2',
      title: '消息',
    );
  }
}
