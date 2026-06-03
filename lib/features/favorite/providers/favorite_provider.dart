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

class FavoriteNotifier extends AsyncNotifier<FavoriteState> {
  @override
  Future<FavoriteState> build() async {
    try {
      final items = await FavoriteStorage.load();
      return FavoriteState(items: items, isLoading: false);
    } catch (e) {
      return FavoriteState(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      );
    }
  }

  void toggleSelection(String id) {
    final s = state.asData?.value ?? const FavoriteState();
    state = AsyncValue.data(s.copyWith(
      items: s.items.map((item) {
        if (item.id == id) {
          return item.copyWith(isSelected: !item.isSelected);
        }
        return item;
      }).toList(),
    ));
  }

  void toggleSelectionMode() {
    final s = state.asData?.value ?? const FavoriteState();
    if (s.isSelectionMode) {
      state = AsyncValue.data(s.copyWith(
        isSelectionMode: false,
        items: s.items.map((e) => e.copyWith(isSelected: false)).toList(),
      ));
    } else {
      state = AsyncValue.data(s.copyWith(isSelectionMode: true));
    }
  }

  void selectAll() {
    final s = state.asData?.value ?? const FavoriteState();
    state = AsyncValue.data(s.copyWith(
      items: s.items.map((e) => e.copyWith(isSelected: true)).toList(),
    ));
  }

  Future<void> deleteSelected() async {
    final s = state.asData?.value ?? const FavoriteState();
    final remaining = s.items.where((e) => !e.isSelected).toList();
    state = AsyncValue.data(FavoriteState(
      items: remaining,
      isLoading: false,
      isSelectionMode: false,
    ));
    await FavoriteStorage.save(remaining);
  }

  void reorder(int oldIndex, int newIndex) {
    final s = state.asData?.value ?? const FavoriteState();
    final items = [...s.items];
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    state = AsyncValue.data(s.copyWith(items: items));
    FavoriteStorage.save(items);
  }

  Future<void> retry() async {
    state = const AsyncValue.loading();
    try {
      final items = await FavoriteStorage.load();
      state = AsyncValue.data(FavoriteState(items: items, isLoading: false));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final favoriteProvider = AsyncNotifierProvider<FavoriteNotifier, FavoriteState>(
  FavoriteNotifier.new,
);
