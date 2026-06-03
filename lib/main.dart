import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/network/dio_client.dart';
import 'core/network/network_monitor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioClient.init();
  NetworkMonitor.init();

  runApp(const ProviderScope(child: YamiboApp()));
}
