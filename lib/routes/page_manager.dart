import 'dart:async';
import 'package:flutter/material.dart';

class PageManager<T> extends ChangeNotifier {
  late Completer<T> _completer;

  Future<T> waitForResult() async {
    _completer = Completer<T>();
    return _completer.future;
  }

  void returnData(T value) {
    _completer.complete(value);
  }
}
