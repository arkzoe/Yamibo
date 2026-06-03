import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RacingDnsResolver {
  static const _dohServers = [
    'https://dns.alidns.com/resolve?name=',
    'https://doh.pub/dns-query?name=',
  ];
  static const _dnsTimeout = Duration(milliseconds: 1500);

  Future<List<InternetAddress>> resolve(String host, {int? type}) async {
    final futures = _dohServers.map((server) =>
        _resolveDoH(server, host).timeout(_dnsTimeout));
    final results = await Future.wait(futures, eagerError: false);
    for (final result in results) {
      if (result.isNotEmpty) return result;
    }
    return InternetAddress.lookup(host);
  }

  Future<List<InternetAddress>> _resolveDoH(
      String server, String host) async {
    try {
      final uri = Uri.parse('$server$host&type=A');
      final response = await http.get(uri);
      if (response.statusCode != 200) return [];
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final answer = data['Answer'] as List? ?? [];
      return answer
          .where((a) => a['type'] == 1)
          .map((a) => InternetAddress(a['data'] as String))
          .toList();
    } catch (_) {
      return [];
    }
  }
}
