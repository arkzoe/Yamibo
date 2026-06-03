import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/history_entry.dart';
import '../../../core/storage/history_storage.dart';

class HistoryNotifier extends AsyncNotifier<List<HistoryEntry>> {
  @override
  Future<List<HistoryEntry>> build() async {
    return HistoryStorage.load();
  }

  Future<void> deleteEntry(String id) async {
    final current = state.asData?.value ?? [];
    final updated = current.where((e) => e.id != id).toList();
    state = AsyncValue.data(updated);
    await HistoryStorage.save(updated);
  }

  Future<void> clearAll() async {
    state = const AsyncValue.data([]);
    await HistoryStorage.save([]);
  }
}

final historyProvider = AsyncNotifierProvider<HistoryNotifier, List<HistoryEntry>>(
  HistoryNotifier.new,
);
