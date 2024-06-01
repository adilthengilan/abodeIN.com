import 'package:flutter/material.dart';

class ServiceProvider extends ChangeNotifier {
  List<String> icons = [];

  int selectedCategoryIndex = 0;

  void setCategoryButtonColor(index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  

  final WhatWeOffering = [
    {"IconName": "Parking",
    "Icon": "assets/images/parking_icon.png",
    },
    {"IconName": "Wifi",
    "Icon": "assets/images/Wifi_icon.png",
    },
    {"IconName": "Laudry",
    "Icon": "assets/images/laundry_icon.png",
    },
    {"IconName": "Ac",
    "Icon": "assets/images/ac_icon.png",
    },
    {"IconName": "Bar",
    "Icon": "assets/images/bar_icon.png",
    },
  ];
}
