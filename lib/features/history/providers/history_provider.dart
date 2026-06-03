import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/history_entry.dart';
import '../../../core/storage/history_storage.dart';

class HistoryNotifier extends Notifier<List<HistoryEntry>> {
  @override
  List<HistoryEntry> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    state = await HistoryStorage.load();
  }

  Future<void> deleteEntry(String id) async {
    state = state.where((e) => e.id != id).toList();
    await HistoryStorage.save(state);
  }

  Future<void> clearAll() async {
    state = [];
    await HistoryStorage.save(state);
  }
}

final historyProvider = NotifierProvider<HistoryNotifier, List<HistoryEntry>>(
  HistoryNotifier.new,
);
