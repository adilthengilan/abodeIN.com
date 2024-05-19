import 'package:flutter/material.dart';

class HotelDetailProvider extends ChangeNotifier {
  List<String> icons = [];

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

  List<String> reviewrsPersonsImage = [
    "assets/images/reviewrs_person_1.png",
    "assets/images/reviewers_person_2.png"
  ];
}