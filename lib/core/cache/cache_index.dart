class CacheIndex {
  final String key;
  final DateTime cachedAt;
  final int size;

  const CacheIndex({
    required this.key,
    required this.cachedAt,
    required this.size,
  });
}
