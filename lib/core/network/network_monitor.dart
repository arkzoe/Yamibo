import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { connected, disconnected }

class NetworkMonitor {
  static final Connectivity _connectivity = Connectivity();
  static final StreamController<NetworkStatus> _controller =
      StreamController<NetworkStatus>.broadcast();

  static Stream<NetworkStatus> get statusStream => _controller.stream;
  static NetworkStatus _currentStatus = NetworkStatus.connected;

  static NetworkStatus get currentStatus => _currentStatus;

  static void init() {
    _connectivity.onConnectivityChanged.listen((results) {
      final hasConnection = results.any((r) => r != ConnectivityResult.none);
      _currentStatus =
          hasConnection ? NetworkStatus.connected : NetworkStatus.disconnected;
      _controller.add(_currentStatus);
    });
  }
}
