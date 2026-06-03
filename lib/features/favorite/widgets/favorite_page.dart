import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorite_provider.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(favoriteProvider);
    final notifier = ref.read(favoriteProvider.notifier);

    return stateAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Scaffold(
        appBar: AppBar(title: const Text('收藏')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 64),
              const SizedBox(height: 16),
              Text(err.toString()),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => notifier.retry(),
                child: const Text('重试'),
              ),
            ],
          ),
        ),
      ),
      data: (state) => Scaffold(
        appBar: AppBar(
          title: Text(state.isSelectionMode ? '选择收藏' : '收藏'),
        actions: [
          if (state.isSelectionMode) ...[
            TextButton(
              onPressed: () => notifier.selectAll(),
              child: const Text('全选'),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: state.items.any((e) => e.isSelected)
                  ? () => notifier.deleteSelected()
                  : null,
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => notifier.toggleSelectionMode(),
            ),
          ] else
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => notifier.toggleSelectionMode(),
            ),
        ],
      ),
      body: state.items.isEmpty
          ? const Center(child: Text('暂无收藏'))
          : ReorderableListView.builder(
              itemCount: state.items.length,
              onReorderItem: notifier.reorder,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return _FavoriteItemTile(
                  key: ValueKey(item.id),
                  item: item,
                  isSelectionMode: state.isSelectionMode,
                  onTap: () {
                    if (state.isSelectionMode) {
                      notifier.toggleSelection(item.id);
                    }
                  },
                );
              },
            ),
      ),
    );
  }
}

class _FavoriteItemTile extends StatelessWidget {
  final dynamic item;
  final bool isSelectionMode;
  final VoidCallback onTap;

  const _FavoriteItemTile({
    super.key,
    required this.item,
    required this.isSelectionMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isSelectionMode
          ? Checkbox(
              value: item.isSelected,
              onChanged: (_) => onTap(),
            )
          : const Icon(Icons.bookmark),
      title: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: item.author.isNotEmpty ? Text(item.author) : null,
      trailing: isSelectionMode ? null : const Icon(Icons.drag_handle),
      onTap: isSelectionMode ? onTap : null,
    );
  }
}
