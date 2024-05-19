import 'package:abodein/src/model/hotel_model_class.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;
  int bottombarindex = 0;

  void setBottomBarindex(index) {
    bottombarindex = index;
    notifyListeners();
  }

  void setCategoryButtonColor(index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  List<dynamic> categories = [
    {
      "Name": "Restuarant",
      "image": "assets/images/restuarant Icon.png",
    },
    {
      "Name": "Luandry",
      "image": "assets/images/Luandry.png",
    },
    {
      "Name": "Cleaning",
      "image": "assets/images/Cleaning.png",
    },
    {
      "Name": "Event",
      "image": "assets/images/Event.png",
    },
  ];

  List<dynamic> SuggestionsHotel = [
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/suggetion_hotel_image_1.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/suggetion_hotel_image_2.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/suggetion_hotel_image_1.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/suggetion_hotel_image_2.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
  ];

  List<dynamic> popularHotels = [
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/popular_hotel_image_1.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/popular_hotels_image_2.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: "assets/images/popular_hotel_image_3.png",
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
  ];
}
