import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;

  void setCategoryButtonColor(index){
    selectedCategoryIndex = index;
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