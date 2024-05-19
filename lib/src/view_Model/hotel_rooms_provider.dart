import 'package:flutter/material.dart';

class HotelRoomsProvider extends ChangeNotifier {
  List <dynamic> bookingHistory = [];

  void addToBookingHistory(String name, String image, int price, double rating,String description) {
    final BookedItem = {
      "name": name,
      "image": image,
      "price": price,
      "rating": rating,
      "description": description
    };
    bookingHistory.add(BookedItem);
  }

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
  List<String> RoomType = [
    "Premium Room",
    "Standard Room",
  ];
}