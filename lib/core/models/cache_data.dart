import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_data.freezed.dart';
part 'cache_data.g.dart';

@freezed
sealed class CacheData with _$CacheData {
  const factory CacheData({
    required String key,
    required String htmlContent,
    @Default(1) int maxPageNum,
    @Default('') String authorId,
    required DateTime cachedAt,
  }) = _CacheData;

  factory CacheData.fromJson(Map<String, dynamic> json) =>
      _$CacheDataFromJson(json);
}
