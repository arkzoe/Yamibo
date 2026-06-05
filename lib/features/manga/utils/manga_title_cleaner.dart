class MangaTitleCleaner {
  MangaTitleCleaner._();

  static final _bracketPatterns = [
    RegExp(r'\[[^\]]*\]'),
    RegExp(r'（[^）]*）'),
    RegExp(r'\([^\)]*\)'),
  ];

  static final _suffixPatterns = [
    RegExp(r'\s*\[.*?(?:重传|整理|修正|汉化|更新|修复).*?\]$'),
    RegExp(r'\s*[\(（].*?(?:重传|整理|修正|汉化|更新|修复).*?[\)）]$'),
  ];

  static String clean(String title) {
    var result = title.trim();
    for (final pattern in _suffixPatterns) {
      result = result.replaceAll(pattern, '');
    }
    for (final pattern in _bracketPatterns) {
      result = result.replaceAll(pattern, '').trim();
    }
    result = result.replaceAll(RegExp(r'\s+'), ' ');
    return result.trim();
  }
}
