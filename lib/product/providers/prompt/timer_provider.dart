import 'dart:async';

import 'package:flutter/widgets.dart';

class TimerProvider extends ChangeNotifier {
  int _counter = 3;
  Timer? _timer;

  int get counter => _counter;

  void startTimer() {
    _counter = 3;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        _counter--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
