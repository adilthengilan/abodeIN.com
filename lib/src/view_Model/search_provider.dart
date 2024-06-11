import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SearchProvider extends ChangeNotifier {
  List<dynamic> foundHotels = [];
  Position? currentPosition;

  void runSearching(String enteringKey, hotels) {
    List result = [];

    if (enteringKey.isEmpty) {
      result = result;
    } else {
      result = hotels
          .where((hotel) => hotel
              .toString()
              .toLowerCase()
              .contains(enteringKey.toLowerCase()))
          .toList();
    }

    foundHotels = result;
    print('Found Hotels $foundHotels');
    notifyListeners();
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);
    print(hasPermission);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      currentPosition = position;
      print(currentPosition);
      notifyListeners();
    }).catchError((e) {
      debugPrint(e);
    });
  }
}