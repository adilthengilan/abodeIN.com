import 'package:abodein/src/model/hotel_model_class.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  List<dynamic> categories = [
    {
      "Name": "Hotels",
      "image": "assets/images/hotels_category_image.png",
    },
    {
      "Name": "Motels",
      "image": "assets/images/motels_category_image.png",
    },
    {
      "Name": "Resorts",
      "image": "assets/images/resort_category_image.png",
    },
    {
      "Name": "Bed &Breakfast",
      "image": "assets/images/bed_and_breakfast_category_Image.png",
    },
    {
      "Name": "Hostels",
      "image": "assets/images/hostels_category_image.png",
    }
  ];

  List<dynamic> SuggestionsHotel = [
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/suggetion_hotel_image_1.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/suggetion_hotel_image_2.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/suggetion_hotel_image_1.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/suggetion_hotel_image_2.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
  ];

  List<dynamic> popularHotels = [
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/popular_hotel_image_1.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/popular_hotels_image_2.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
    Hotel(
      name: "Lux Hotel",
      image: [
        "assets/images/popular_hotel_image_3.png",
      ],
      price: 488,
      rating: 4.88,
      location: "Kochi, India",
    ),
  ];
}
