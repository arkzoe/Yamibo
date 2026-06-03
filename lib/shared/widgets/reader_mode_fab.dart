import 'package:flutter/material.dart';

class ReaderModeFab extends StatelessWidget {
  final VoidCallback onTap;

  const ReaderModeFab({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      onPressed: onTap,
      child: const Icon(Icons.import_contacts),
    );
  }
}
