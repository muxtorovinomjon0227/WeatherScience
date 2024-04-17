import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../utils/pop_up_modal.dart';

class ConnectivityService {

  Future<bool> checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      return false;
    }
  }
}

class InternetService {
  InternetService._();

  static late StreamSubscription<List<ConnectivityResult>> _subscription;

  static Future<void> onConnectivityChanged(BuildContext context) async {
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) async {
      bool isConnection = await ConnectivityService().checkConnectivity();
      if(!isConnection && context.mounted){
        connectPopUp(context);
      }
    });
  }

  static Future<bool> isConnection() async {
    bool isConnection = await ConnectivityService().checkConnectivity();
    return isConnection;
  }

  static Future<void> pause() async {
    _subscription.pause();
  }
  static Future<void> resume() async {
    _subscription.resume();
  }

}
