import 'dart:async';
import 'package:abodein/src/view/common_Widgets/toast_messege.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  int bottombarindex = 0;
  bool isTimeStarted = false;

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

  int seconds = 22 * 60 * 60; // 22 hours in seconds
  Timer? timer;
// Booking CountDown Timer
  void startTimer(int Hour, int minute) {
    DateTime now = DateTime.now();
    if (now.hour == Hour && now.minute == minute) {
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

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

//Location searching
  String locationText = "";

  void setlocation(locationAddress) async {
    locationText = locationAddress;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locationText', locationText);
    notifyListeners();
  }

  void loadlocationText() async {
    final prefs = await SharedPreferences.getInstance();
    locationText = prefs.getString('locationText') ?? '';
    notifyListeners();
  }

  //Room Guest Select Count
  int rooms = 1;
  int adults = 1;
  int children = 0;
  List<int> childrenAges = [];

  void setRoomCount(value) {
    rooms = value;
    notifyListeners();
  }

  void setAdultsCount(value) {
    adults = value;
    notifyListeners();
  }
  
  void setChildrenCount(value) {
    children = value;
    childrenAges = List.filled(value, 0);
    notifyListeners();
  }
  //aading The childrens age to list by value 
  void setChildrenAges(newvalue, index) {
    childrenAges[index] = newvalue ?? 0;
    notifyListeners();
  }

// when the user submit the data of Rooms, Adults, Children, Children Ages
  void submitingRoomsGuestCount(context) async {
    if (rooms >= 1 && adults >= 1 && childrenAges.length == children) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('rooms', rooms);
      await prefs.setInt('adults', adults);
      await prefs.setInt('children', children);
      await prefs.setStringList('childrenAges', childrenAges.map((age) => age.toString()).toList());
      Navigator.pop(context);
    } else {
      toastmessege('Please select the ages of the children!.');
    }
  }

  Future<void> loadRoomsAndGuestCount() async {
    if (rooms >= 1 && adults >= 1 && childrenAges.length == children) {
      final prefs = await SharedPreferences.getInstance();
      rooms = prefs.getInt('rooms') ?? 1;
      adults = prefs.getInt('adults') ?? 1;
      children = prefs.getInt('children') ?? 0;
      childrenAges = prefs.getStringList('childrenAges')?.map((age) => int.parse(age)).toList() ??[0];
      notifyListeners();
    }
  }
}
