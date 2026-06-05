import 'package:flutter/material.dart';

class MangaSettingsPanel extends StatelessWidget {
  final int readingMode;
  final bool fitWidth;
  final ValueChanged<int> onReadingModeChanged;
  final VoidCallback onToggleFitWidth;

  const MangaSettingsPanel({
    super.key,
    required this.readingMode,
    required this.fitWidth,
    required this.onReadingModeChanged,
    required this.onToggleFitWidth,
  });

  @override
  Widget build(BuildContext context) {
    final titles = ['上下滚动', '左→右', '右→左'];
    final icons = [Icons.swap_vert, Icons.chevron_right, Icons.chevron_left];

    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('阅读模式',
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 8),
          Row(
            children: List.generate(3, (i) {
              final selected = readingMode == i;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: i > 0 ? 4 : 0,
                    right: i < 2 ? 4 : 0,
                  ),
                  child: ChoiceChip(
                    selected: selected,
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icons[i], size: 18),
                        const SizedBox(width: 4),
                        Text(titles[i], style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                    onSelected: (_) => onReadingModeChanged(i),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('适配宽度'),
              const Spacer(),
              Switch(
                value: fitWidth,
                onChanged: (_) => onToggleFitWidth(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
