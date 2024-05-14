import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  String locationText = '';

// assigning category selected button index to selectecategorindex variable
  void setCategoryButtonColor(index){
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void setLocationAddress(LocationDataAddress){
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
}
