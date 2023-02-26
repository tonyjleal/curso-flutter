import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter;

  int get counter => _counter;

  CounterProvider(this._counter);

  increment() {
    _counter++;
    notifyListeners();
  }

  decrement() {
    _counter--;
    notifyListeners();
  }
}
