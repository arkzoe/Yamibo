import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/favorite.dart';
import '../../../core/storage/favorite_storage.dart';

class FavoriteState {
  final List<FavoriteItem> items;
  final bool isLoading;
  final bool isError;
  final String? errorMessage;
  final bool isSelectionMode;

  const FavoriteState({
    this.items = const [],
    this.isLoading = true,
    this.isError = false,
    this.errorMessage,
    this.isSelectionMode = false,
  });

  FavoriteState copyWith({
    List<FavoriteItem>? items,
    bool? isLoading,
    bool? isError,
    String? errorMessage,
    bool? isSelectionMode,
  }) {
    return FavoriteState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      isSelectionMode: isSelectionMode ?? this.isSelectionMode,
    );
  }
}

class FavoriteNotifier extends Notifier<FavoriteState> {
  @override
  FavoriteState build() {
    _load();
    return const FavoriteState();
  }

  Future<void> _load() async {
    try {
      final items = await FavoriteStorage.load();
      state = state.copyWith(items: items, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  void toggleSelection(String id) {
    state = state.copyWith(
      items: state.items.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelected: !item.isSelected);
        }
        return item;
      }).toList(),
    );
  }

  void toggleSelectionMode() {
    if (state.isSelectionMode) {
      state = state.copyWith(
        isSelectionMode: false,
        items: state.items.map((e) => e.copyWith(isSelected: false)).toList(),
      );
    } else {
      state = state.copyWith(isSelectionMode: true);
    }
  }

  void selectAll() {
    state = state.copyWith(
      items: state.items.map((e) => e.copyWith(isSelected: true)).toList(),
    );
  }

  Future<void> deleteSelected() async {
    final remaining = state.items.where((e) => !e.isSelected).toList();
    state = state.copyWith(items: remaining, isSelectionMode: false);
    await FavoriteStorage.save(remaining);
  }

  void reorder(int oldIndex, int newIndex) {
    final items = [...state.items];
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = state.copyWith(items: items);
    FavoriteStorage.save(items);
  }
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, FavoriteState>(
  FavoriteNotifier.new,
);
