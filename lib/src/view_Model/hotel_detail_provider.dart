import 'package:flutter/material.dart';

class HotelDetailProvider extends ChangeNotifier {
  List<String> icons = [];
  List<dynamic> favoriteList = [];
  bool isFavorite = false;

  void setfavoriteButton() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void addToFavorite(
      String name, String image, int price, double rating, String description) {
    final favoriteItem = {
      "name": name,
      "image": image,
      "price": price,
      "rating": rating,
      "description": description
    };
    favoriteList.add(favoriteItem);
    print(favoriteList.length);
  }

  void removeFromFavorite(
      String name, String image, int price, double rating, String description) {
    final favoriteItem = {
      "name": name,
      "image": image,
      "price": price,
      "rating": rating,
      "description": description
    };
    favoriteList.remove(favoriteItem);
    print(favoriteList);
  }

  final WhatWeOffering = [
    {
      "IconName": "Parking",
      "Icon": "assets/images/parking_icon.png",
    },
    {
      "IconName": "Wifi",
      "Icon": "assets/images/Wifi_icon.png",
    },
    {
      "IconName": "Laudry",
      "Icon": "assets/images/laundry_icon.png",
    },
    {
      "IconName": "Ac",
      "Icon": "assets/images/ac_icon.png",
    },
    {
      "IconName": "Bar",
      "Icon": "assets/images/bar_icon.png",
    },
  ];

  List<String> reviewrsPersonsImage = [
    "assets/images/reviewrs_person_1.png",
    "assets/images/person_dp.png"
  ];
}