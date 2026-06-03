import 'package:flutter/material.dart';

class AppShellScaffold extends StatelessWidget {
  final Widget child;

  const AppShellScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}
