import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_entry.freezed.dart';
part 'history_entry.g.dart';

@freezed
sealed class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required String id,
    required String title,
    required String url,
    @Default('') String type,
    @Default(0) int lastReadChapter,
    @Default(0.0) double scrollOffset,
    required DateTime lastReadAt,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$HistoryEntryFromJson(json);
}
