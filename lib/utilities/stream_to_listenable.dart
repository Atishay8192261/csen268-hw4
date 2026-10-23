import 'dart:async';

import 'package:flutter/material.dart';

class StreamToListenable extends ChangeNotifier {
  late final StreamSubscription subscription;

  StreamToListenable(Stream stream) {
    subscription = stream.asBroadcastStream().listen((event) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
