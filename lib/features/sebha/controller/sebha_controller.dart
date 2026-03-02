import 'package:flutter/material.dart';

class SebhaController extends ChangeNotifier {

  int _counter = 0;
  String? _currentZekr;

  // ===== Getters =====
  int get counter => _counter;
  String? get currentZekr => _currentZekr;

  // ===== Logic =====
  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }

  void updateZekr(String? value) {
    _currentZekr =
        (value == null || value.isEmpty) ? null : value;

    _counter = 0;

    notifyListeners();
  }
}