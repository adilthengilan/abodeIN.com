import 'package:abodein/src/view/common_Widgets/toast_messages.dart';
import 'package:abodein/src/view_Model/location_searching.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class FeaturesProvider extends ChangeNotifier {
  final toDayDate = DateTime.now();
  List<DateTime> selectedDates = [];
  List<DateTime> conformedDate = [];

  String checkingDate = '';
  String checkoutDate = '';

  void onSelected(selectedDay, context) {
    if (selectedDay.isBefore(toDayDate)) return;

    // when two selected they want select another one
    if (selectedDates.length >= 2) {
      selectedDates.clear();
    }

    if (selectedDates.isEmpty || selectedDates.length == 1) {
      selectedDates.add(selectedDay);
      selectedDates.sort();

      if (selectedDates.length >= 2) {
        final difference =
            selectedDates.last.difference(selectedDates[0]).inDays;

        if (difference > 27) {
          selectedDates.clear();
          toastmessege("Hotels can't be Booked for a maximum of 28 Days.");
        } else {
          // Add dates between the two selected dates to the list
          List<DateTime> betweenDates = [];
          DateTime currentDate = selectedDates[0];

          while (currentDate.isBefore(selectedDates[1])) {
            betweenDates.add(currentDate);
            currentDate = currentDate.add(Duration(days: 1));
          }
          betweenDates.add(selectedDates[1]); // add the end date
          if (betweenDates.length <= 28) {
            selectedDates = betweenDates;
          } else {
            selectedDates.clear(); // Remove the second date if the range is more than 28 days
          }
          final firstDay = DateFormat.d().format(selectedDates[0]);
          final lastDay = DateFormat.d().format(selectedDates.last);
          final firstmonth = DateFormat.MMM().format(selectedDates[0]);
          final lastMonth = DateFormat.MMM().format(selectedDates.last);
          final firstDayName = DateFormat.E().format(selectedDates[0]);
          final lastDayName = DateFormat.E().format(selectedDates.last);
          checkingDate = '$firstDayName $firstDay $firstmonth';
          checkoutDate = '$lastDayName $lastDay  $lastMonth';
        }
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////// Location searching Provider ////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  final GeocodingService _geocodingService = GeocodingService();
  String? _currentAddress;
  Position? _currentPosition;
  List<dynamic> searchResults = [];
  List<String> recentLocationHistory = [];
  String locationText = '';
  bool isLoading = false;

  // Handling Location permision from device
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this also has a
        // callback for when the user denies permissions).
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return true;
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    isLoading = false;
    notifyListeners();
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  //Tarsalating log, lat to human readable language, Location Address
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress = '${place.street}, ${place.subLocality}, '
          '${place.subAdministrativeArea}, ${place.postalCode}';
      locationText = _currentAddress ?? '';
      notifyListeners();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // on changed function in the search bar, this function will passing user input to Api service and list all the matching in the listview builder
  void searchLocations(value) async {
    if (value != null) {
      final results = await _geocodingService.searchLocations(value);
      searchResults = results;
      notifyListeners();
    }
  }
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setLocationText(locationName) {
    locationText = locationName;
    notifyListeners();
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void simulateLoading() async {
    isLoading = true;

    // Simulate a network call or any other asynchronous operation
    await Future.delayed(Duration(seconds: 3));

    isLoading = false;
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}