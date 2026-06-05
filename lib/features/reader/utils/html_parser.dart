import 'dart:convert';
import '../../../core/models/content.dart';
import '../models/chapter_info.dart';

class TocEntry {
  final String pid;
  final String title;
  TocEntry({required this.pid, required this.title});
}

class HtmlParser {
  HtmlParser._();

  /// Extract thread author ID from a parsed API v1 JSON response.
  /// Navigates Variables → thread → authorid, same as Kotlin version.
  static String extractAuthorIdFromJson(Map<String, dynamic> json) {
    try {
      final variables = json['Variables'] as Map<String, dynamic>?;
      if (variables == null) return '';
      final thread = variables['thread'] as Map<String, dynamic>?;
      if (thread == null) return '';
      return thread['authorid']?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  /// Fallback: extract authorId from raw response via regex.
  /// Only works reliably when the first '"authorid"' in the raw response
  /// belongs to the thread object (not a post). Prefer extractAuthorIdFromJson.
  static String extractAuthorId(String html) {
    final m = RegExp(r'"authorid"\s*:\s*"(\d+)"').firstMatch(html);
    return m?.group(1) ?? '';
  }

  static List<TocEntry> extractTocEntries(String messageHtml) {
    final pattern = RegExp(
      r'<a\s[^>]*href="[^"]*ptid=\d+[^"]*pid=(\d+)[^"]*"[^>]*>(.*?)</a>',
      caseSensitive: false,
      dotAll: true,
    );
    final seen = <String>{};
    final entries = <TocEntry>[];
    for (final m in pattern.allMatches(messageHtml)) {
      final pid = m.group(1)!;
      if (seen.contains(pid)) continue;
      seen.add(pid);
      final title = m.group(2)!
          .replaceAll(RegExp(r'<[^>]+>'), '')
          .replaceAll(RegExp(r'&[a-z]+;'), '')
          .trim();
      if (title.isNotEmpty) entries.add(TocEntry(pid: pid, title: title));
    }
    return entries;
  }

  static Map<String, String> extractTocFromPage(String html) {
    final postlistStr = _extractPostlistArray(html);
    if (postlistStr == null) return {};
    try {
      final posts = jsonDecode(postlistStr) as List<dynamic>;
      if (posts.isEmpty) return {};
      final firstMsg = (posts[0] as Map)['message'] as String? ?? '';
      return {for (final e in extractTocEntries(firstMsg)) e.pid: e.title};
    } catch (_) {
      return {};
    }
  }

  /// Extract the postlist JSON array from a raw API response.
  /// Returns null if not found. Made public for use by ReaderNotifier.
  static String? extractPostlistArray(String html) {
    return _extractPostlistArray(html);
  }

  /// Extract thread author ID from the raw API response HTML.
  /// Uses the postlist JSON: the first post is always the thread starter
  /// in Discuz, so its authorid is the thread author's ID.
  static String extractAuthorIdFromHtml(String html) {
    final postlistStr = _extractPostlistArray(html);
    if (postlistStr == null) return extractAuthorId(html);
    try {
      final posts = jsonDecode(postlistStr) as List<dynamic>;
      final id = extractAuthorIdFromPostlist(posts);
      if (id.isNotEmpty) return id;
      return extractAuthorId(html);
    } catch (_) {
      return extractAuthorId(html);
    }
  }

  /// Extract thread author ID from the postlist JSON.
  /// The first post in a Discuz thread is always the thread starter,
  /// so its authorid is the thread author's ID.
  static String extractAuthorIdFromPostlist(List<dynamic> posts) {
    if (posts.isEmpty) return '';
    try {
      final first = posts[0] as Map<String, dynamic>;
      return first['authorid']?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  static ({List<Content> contents, List<ChapterInfo> chapters}) parsePageContent({
    required String html,
    required String tid,
    String? authorId,
    bool loadImages = true,
    Map<String, String>? tocTitleMap,
  }) {
    final postlistStr = _extractPostlistArray(html);
    if (postlistStr == null) return (contents: [], chapters: []);

    final List<dynamic> posts;
    try {
      posts = jsonDecode(postlistStr) as List<dynamic>;
    } catch (_) {
      return (contents: [], chapters: []);
    }

    // Resolve authorId: use provided value, or extract from first post
    // (which is always the thread starter in Discuz).
    final resolvedAuthorId = (authorId != null && authorId.isNotEmpty)
        ? authorId
        : extractAuthorIdFromPostlist(posts);

    final filtered = _filterPosts(posts, authorId: resolvedAuthorId);

    // Build pid→title map: use provided TOC or extract from first OP post
    final titleByPid = <String, String>{};
    if (tocTitleMap != null) {
      titleByPid.addAll(tocTitleMap);
    } else if (filtered.isNotEmpty) {
      final firstMsg = (filtered[0] as Map)['message'] as String? ?? '';
      for (final e in extractTocEntries(firstMsg)) {
        titleByPid[e.pid] = e.title;
      }
    }

    final allContents = <Content>[];
    final chapters = <ChapterInfo>[];
    var chapterCount = 0;

    for (int postIdx = 0; postIdx < filtered.length; postIdx++) {
      final p = filtered[postIdx] as Map<String, dynamic>;
      final pid = p['pid']?.toString() ?? '';
      final postAuthorId = p['authorid']?.toString() ?? '';
      final msgHtml = p['message'] as String? ?? '';
      final page = int.tryParse(p['page']?.toString() ?? '') ?? 1;

      final chapterTitle = titleByPid[pid] ?? '';

      // Only add chapter title if we have a real title for this post
      if (chapterTitle.isNotEmpty) {
        allContents.add(Content(
          type: ContentType.text,
          data: chapterTitle,
          isChapterTitle: true,
          postIndex: chapterCount,
          authorId: postAuthorId,
        ));
      }

      var postContents = _processHtml(msgHtml, loadImages: loadImages);
      for (int j = 0; j < postContents.length; j++) {
        postContents[j] = postContents[j].copyWith(
          postIndex: chapterCount,
          authorId: postAuthorId,
        );
      }
      allContents.addAll(postContents);

      // Only create a chapter entry if we have real content or a title
      if (chapterTitle.isNotEmpty || postContents.isNotEmpty) {
        chapters.add(ChapterInfo(
          tid: tid,
          title: chapterTitle.isNotEmpty ? chapterTitle : '第 ${chapters.length + 1} 节',
          page: page,
          authorId: postAuthorId,
          index: chapters.length,
          postIndex: chapterCount,
        ));
        chapterCount++;
      }
    }

    return (contents: allContents, chapters: chapters);
  }

  static int extractMaxPageNum(String html) {
    final patterns = [
      r'"maxpage"\s*:\s*"(\d+)"',
      r'"maxpage"\s*:\s*(\d+)',
    ];
    for (final p in patterns) {
      final m = RegExp(p).firstMatch(html);
      if (m != null) {
        final n = int.tryParse(m.group(1)!);
        if (n != null && n > 0) return n;
      }
    }
    return 1;
  }

  static List<ChapterInfo> parseChaptersFromPage({
    required String html,
    required String tid,
    String? authorId,
    Map<String, String>? tocTitleMap,
  }) {
    final postlistStr = _extractPostlistArray(html);
    if (postlistStr == null) return [];

    try {
      final posts = jsonDecode(postlistStr) as List<dynamic>;

      final resolvedAuthorId = (authorId != null && authorId.isNotEmpty)
          ? authorId
          : extractAuthorIdFromPostlist(posts);

      final filtered = _filterPosts(posts, authorId: resolvedAuthorId);
      final chapters = <ChapterInfo>[];

      for (int i = 0; i < filtered.length; i++) {
        final p = filtered[i] as Map<String, dynamic>;
        final pid = p['pid']?.toString() ?? '';
        final page = int.tryParse(p['page']?.toString() ?? '') ?? 1;

        final title = (tocTitleMap != null && tocTitleMap.containsKey(pid))
            ? tocTitleMap[pid]!
            : '';

        if (title.isNotEmpty) {
          chapters.add(ChapterInfo(
            tid: tid,
            title: title,
            page: page,
            authorId: p['authorid']?.toString() ?? '',
            index: chapters.length,
            postIndex: i,
          ));
        }
      }
      return chapters;
    } catch (_) {
      return [];
    }
  }

  static List<dynamic> _filterPosts(List<dynamic> posts, {String? authorId}) {
    if (authorId == null || authorId.isEmpty) return posts;
    return posts.where((p) {
      final pid = (p as Map)['authorid']?.toString() ?? '';
      return pid == authorId;
    }).toList();
  }

  static String? _extractPostlistArray(String html) {
    final startMatch = RegExp(r'"postlist"\s*:\s*\[').firstMatch(html);
    if (startMatch == null) return null;

    int depth = 0;
    bool inString = false;
    bool escaped = false;
    int i = startMatch.end - 1;

    while (i < html.length) {
      final ch = html[i];
      if (escaped) {
        escaped = false;
      } else if (ch == '\\' && inString) {
        escaped = true;
      } else if (ch == '"') {
        inString = !inString;
      } else if (!inString) {
        if (ch == '[') {
          depth++;
        } else if (ch == ']') {
          depth--;
          if (depth == 0) {
            return html.substring(startMatch.end - 1, i + 1);
          }
        }
      }
      i++;
    }
    return null;
  }

  static List<Content> _processHtml(String html, {bool loadImages = true}) {
    if (loadImages) {
      html = html.replaceAllMapped(
        RegExp(r'<img\s[^>]*>', caseSensitive: false),
        (m) {
          final attrs = m.group(0)!;
          String? url;

          final zoomMatch = RegExp(
            r'zoomfile\s*=\s*"([^"]+)"', caseSensitive: false,
          ).firstMatch(attrs);
          if (zoomMatch != null) url = zoomMatch.group(1)!;

          if (url == null) {
            final fileMatch = RegExp(
              r'\bfile\s*=\s*"([^"]+)"', caseSensitive: false,
            ).firstMatch(attrs);
            if (fileMatch != null) url = fileMatch.group(1)!;
          }

          if (url == null) {
            final srcMatch = RegExp(
              r'\bsrc\s*=\s*"([^"]+)"', caseSensitive: false,
            ).firstMatch(attrs);
            if (srcMatch != null) url = srcMatch.group(1)!;
          }

          if (url == null) return m.group(0)!;
          final imgUrl = url;

          final skip = [
            'smiley', 'avatar', 'icon', 'emoji',
            'static/image', 'thumb', 'common', 'star',
            '组图', '编辑', '分享',
          ];
          if (skip.any((k) => imgUrl.contains(k))) return '';

          final fullUrl = imgUrl.startsWith('http')
              ? imgUrl
              : 'https://bbs.yamibo.com/$imgUrl';
          return '\nIMG:$fullUrl\n';
        },
      );
    }

    String text = html
        .replaceAll(RegExp(r'<br\s*/?>'), '\n\n')
        .replaceAll(RegExp(r'</?div[^>]*>'), '\n\n')
        .replaceAll(RegExp(r'</?p[^>]*>'), '\n\n')
        .replaceAll(RegExp(r'\[/?attach\]'), '')
        .replaceAll(RegExp(r'\[attach\]\d+\[/attach\]'), '')
        .replaceAll(RegExp(r'<[^>]+>'), '')
        .replaceAll(RegExp(r'&nbsp;'), ' ')
        .replaceAll(RegExp(r'&[a-z]+;'), '')
        .replaceAll(RegExp(r'\n{3,}'), '\n\n')
        .trim();

    final headerPattern = RegExp(r'^发表于\s+\d{4}');
    final paragraphs = text
        .split('\n')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty && !headerPattern.hasMatch(p));

    final contents = <Content>[];
    for (final p in paragraphs) {
      if (p.startsWith('IMG:')) {
        contents.add(Content(
          type: ContentType.image,
          data: p.substring(4),
        ));
      } else {
        contents.add(Content(type: ContentType.text, data: p));
      }
    }

    if (contents.isEmpty) {
      final fallback = html
          .replaceAll(RegExp(r'<[^>]+>'), '\n')
          .replaceAll(RegExp(r'&nbsp;'), ' ')
          .replaceAll(RegExp(r'&[a-z]+;'), '')
          .trim();
      if (fallback.isNotEmpty) {
        for (final line in fallback
            .split('\n')
            .map((p) => p.trim())
            .where((p) => p.isNotEmpty)) {
          contents.add(Content(type: ContentType.text, data: line));
        }
      }
    }

    return contents;
  }
}
