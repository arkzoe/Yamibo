import '../../services/manga_api.dart';

class ContentProberResult {
  final int type;
  final String tid;
  final String title;
  final String authorId;
  final String fid;
  final String forumName;

  const ContentProberResult({
    required this.type,
    required this.tid,
    this.title = '',
    this.authorId = '',
    this.fid = '',
    this.forumName = '',
  });
}

class ContentProber {
  ContentProber._();

  static const _mangaFids = {'13', '30', '46'};
  static const _novelFids = {'49', '55'};
  static const _mangaForumNames = [
    '中文百合漫画区',
    '貼圖區',
    '贴图区',
    '原创图作区',
    '百合漫画图源区',
  ];
  static const _novelForumNames = [
    '文學區',
    '文学区',
    '轻小说/译文区',
    'TXT小说区',
  ];

  static String? extractTid(String url) {
    final tidMatch = RegExp(r'tid=(\d+)').firstMatch(url);
    if (tidMatch != null) return tidMatch.group(1);
    final threadMatch = RegExp(r'thread-(\d+)-').firstMatch(url);
    if (threadMatch != null) return threadMatch.group(1);
    return null;
  }

  static Future<ContentProberResult> probe(String url) async {
    final tid = extractTid(url);
    if (tid == null) {
      return const ContentProberResult(type: 3, tid: '');
    }

    try {
      final html = await MangaApi.getThreadDetailApi(tid);

      final fid = _extractFid(html);
      final forumName = _extractForumName(html);
      final title = _extractTitle(html);
      final authorId = _extractAuthorId(html);

      final type = _classify(fid, forumName);
      return ContentProberResult(
        type: type,
        tid: tid,
        title: title,
        authorId: authorId,
        fid: fid,
        forumName: forumName,
      );
    } catch (_) {
      return ContentProberResult(type: 3, tid: tid);
    }
  }

  static int _classify(String fid, String forumName) {
    if (_mangaFids.contains(fid) ||
        _mangaForumNames.any(forumName.contains)) {
      return 2;
    }
    if (_novelFids.contains(fid) ||
        _novelForumNames.any(forumName.contains)) {
      return 1;
    }
    return 3;
  }

  static String _extractFid(String html) {
    final match = RegExp(r'fid=(\d+)').firstMatch(html);
    return match?.group(1) ?? '';
  }

  static String _extractForumName(String html) {
    final match =
        RegExp(r'forumdisplay&fid=\d+[^>]*>([^<]+)').firstMatch(html);
    if (match != null) return match.group(1)!.trim();
    final fallback = RegExp(r'<a[^>]*>([^<]+)</a>.*?›').firstMatch(html);
    return fallback?.group(1)?.trim() ?? '';
  }

  static String _extractTitle(String html) {
    final titleMatch = RegExp(r'<title>([^<]+)').firstMatch(html);
    if (titleMatch != null) {
      var title = titleMatch.group(1)!;
      title = title.replaceAll(RegExp(r'\s*-\s*.*$'), '');
      return title.trim();
    }
    final threadMatch =
        RegExp(r'"subject"\s*:\s*"([^"]+)"').firstMatch(html);
    return threadMatch?.group(1) ?? '';
  }

  static String _extractAuthorId(String html) {
    final match = RegExp(r'"authorid"\s*:\s*"(\d+)"').firstMatch(html);
    if (match != null) return match.group(1)!;
    final altMatch =
        RegExp(r'"author_id"\s*:\s*"(\d+)"').firstMatch(html);
    return altMatch?.group(1) ?? '';
  }
}
