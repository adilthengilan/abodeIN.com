import 'package:abodein/src/view/common_Widgets/toast_messages.dart';
import 'package:flutter/material.dart';

class CalendarProvider extends ChangeNotifier {
  final toDayDate = DateTime.now();
  List<DateTime> selectedDates = [];


  void onSelected(selectedDay, context) {
    print('${toDayDate},       ${DateTime.now()}');
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
        }
      }
    }
    notifyListeners();
  }
}