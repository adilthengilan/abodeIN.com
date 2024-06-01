import 'package:flutter/material.dart';

class BookingFuncProvider extends ChangeNotifier {
  bool bookingconfirm = false;
  void confirmBooking() {
    bookingconfirm = true;
    notifyListeners();
  }
}