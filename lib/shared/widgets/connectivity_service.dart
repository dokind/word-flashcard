// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityWidget extends ChangeNotifier {
  late bool _isConnected;

  bool get isConnected => _isConnected;

  ConnectivityWidget() {
    _isConnected = false;
    initConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _isConnected = false;
      } else {
        _isConnected = true;
      }
      onConnectionChange(_isConnected);
      notifyListeners();
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _isConnected = false;
    } else {
      _isConnected = true;
    }
  }

  void onConnectionChange(bool isConnected);
}

class ConnectivityNotifier extends ConnectivityWidget {
  @override
  void onConnectionChange(bool isConnected) {
    print('isConnected');
    print(isConnected);
  }
}
