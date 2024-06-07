import 'package:flutter/material.dart';

class HotelRoomsProvider extends ChangeNotifier {

  final roomsDetails = [
    {
      "Icon": Icons.location_city_outlined,
      "Service": "City View",
    },
    {
      "Icon": Icons.wifi_outlined,
      "Service": "Free Wifi",
    },
    {
      "Icon": Icons.directions_car_outlined,
      "Service": "Free Self Parking",
    },
    {
      "Icon": Icons.king_bed_rounded,
      "Service": "1 King Bed",
    },
    {
      "Icon": Icons.people_alt_outlined,
      "Service": "Sleeps 3",
    },
  ];
  List<String> roomType = [
    "Deluxe Rooms",
    "Premium Rooms",
    "Standard Rooms",
  ];


  
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

  void setChildrenAges(newvalue, i) {
    childrenAges[i] = newvalue ?? 0;
    notifyListeners();
  }
}
