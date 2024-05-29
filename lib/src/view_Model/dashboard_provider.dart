import 'dart:async';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  String locationText = '';
  int bottombarindex = 0;
    bool isTimeStarted = false;


  int seconds = 22 * 60 * 60; // 22 hours in seconds
  Timer? timer;

  void setBottomBarindex(index) {
    bottombarindex = index;
    notifyListeners();
  }

// assigning category selected button index to selectecategorindex variable
  void setCategoryButtonColor(index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void setLocationAddress(LocationDataAddress) {
    locationText = LocationDataAddress;
    notifyListeners();
  }

  List<dynamic> categories = [
    "Mountain",
    "Beach",
    "Resorts",
    "Bed & Breakfast",
    "Hostels",
  ];

// Booking CountDown Timer
  void startTimer() {
    DateTime now = DateTime.now();
    if (now.hour == 16 && now.minute == 35) {
      if (timer != null) {
        timer!.cancel();
        isTimeStarted = true;
        notifyListeners();
        print("first ${isTimeStarted}");
        print("Hours${now.hour} minutes ${now.minute}");
      }

      seconds = 22 * 60 * 60; // Reset to 22 hours is the Hotel Chekout Time
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds > 0) {
          seconds--;
          notifyListeners();
        } else {
          timer.cancel();
          isTimeStarted = false;
          notifyListeners();
          print("last ${isTimeStarted}");
        }
      });
    }
  }

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secs = seconds % 60;
    return "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }
}
