import 'package:abodein/src/view/hotel_rooms/rooms_details_screen.dart';
import 'package:abodein/utils/app_colors.dart';
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

class RoomProvider with ChangeNotifier {
  Room _room = Room(
    name: 'Deluxe Room',
    color: [
      Color.fromARGB(198, 232, 75, 64),
      Color.fromARGB(217, 223, 86, 132),
      orangeColor,
      Color.fromARGB(199, 103, 81, 227)
    ],
    imageUrl: 'assets/images/The Image of Choose Your Room.png',
    pricePerNight: 320.0,
    facilities: ['Free Wifi', 'Free Parking', 'Mini Bar', 'Laundry'],
    facilityIcons: [
      Icons.wifi,
      Icons.local_parking_outlined,
      Icons.local_bar,
      Icons.local_laundry_service_outlined
    ],
    roomFacilities: [
      'Tea/Coffee Maker',
      'Minibar',
      'Safety Deposit Box',
      'Telephone',
      'Air conditioning',
      'Wake Up Service',
      'Balcony',
      'Radio',
      'Desk',
      'Ironing Facilities',
    ],
  );

  Room get room => _room;

  void updateRoom(Room room) {
    _room = room;
    notifyListeners();
  }
}
