import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  Duration _remainingTime = Duration(hours: 10, minutes: 45, seconds: 22);
  bool _isTimerFinished = false;

  Duration get remainingTime => _remainingTime;
  bool get isTimerFinished => _isTimerFinished;

  TimerProvider() {
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      if (_remainingTime.inSeconds == 0) {
        _isTimerFinished = true;
        timer.cancel();
        notifyListeners();
      } else {
        _remainingTime = Duration(seconds: _remainingTime.inSeconds - 1);
        notifyListeners();
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
