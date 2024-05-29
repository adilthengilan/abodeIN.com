import 'package:flutter/material.dart';

class RoomControllerProvider extends ChangeNotifier {
  bool isDoorLocked = true;
  bool isDoNotDisturb = false;
  bool isSafeMode = false;

  void DeviceLockUnlockController() {
    isDoorLocked = !isDoorLocked;
    notifyListeners();
  }

  void isDoNotDisturbController(){
    isDoNotDisturb = !isDoNotDisturb;
    notifyListeners();
  }

  void isSafeModeController(){
    isSafeMode = !isSafeMode;
    notifyListeners();
  }
}
