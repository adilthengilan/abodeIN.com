import 'package:flutter/material.dart';

class MyBookingsProvider with ChangeNotifier {
  List<Map<String, dynamic>> _bookings = [
    {
      'bookingId': '12345',
      'hotelName': 'Lux Hotel',
      'hotelImage': 'assets/images/rooms_selection.png',
      'checkInDate': '15 Dec 2021',
      'checkOutDate': '20 Dec 2021',
      'guestName': 'John Doe',
      'roomType': 'Deluxe Room',
      'totalCost': '₹5000',
      'status': 'upcoming',
    },
    {
      'bookingId': '67890',
      'hotelName': 'Grand Palace',
      'hotelImage': 'assets/images/The Image of Choose Your Room.png',
      'checkInDate': '25 Dec 2021',
      'checkOutDate': '30 Dec 2021',
      'guestName': 'Jane Smith',
      'roomType': 'Suite',
      'totalCost': '₹8000',
      'status': 'upcoming',
    },
    {
      'bookingId': '67799',
      'hotelName': 'Taj Hotel',
      'hotelImage': 'assets/images/The Image of Choose Your Room.png',
      'checkInDate': '27 Dec 2021',
      'checkOutDate': '1 Jan 2022',
      'guestName': 'Michel',
      'roomType': 'Suite',
      'totalCost': '₹7000',
      'status': 'completed',
    },
    {
      'bookingId': '12346',
      'hotelName': 'Hilton',
      'hotelImage': 'assets/images/rooms_selection.png',
      'checkInDate': '10 Dec 2021',
      'checkOutDate': '15 Dec 2021',
      'guestName': 'Anna',
      'roomType': 'Single Room',
      'totalCost': '₹4000',
      'status': 'cancelled',
    },
  ];

  String _status = 'upcoming';

  List<Map<String, dynamic>> get bookings =>
      _bookings.where((booking) => booking['status'] == _status).toList();

  String get status => _status;

  void setStatus(String newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        setStatus('upcoming');
        break;
      case 1:
        setStatus('completed');
        break;
      case 2:
        setStatus('cancelled');
        break;
    }
  }
}
