import 'package:abodein/src/view/common_Widgets/toast_messege.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/room_controling/room_controller_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookingCalendarPage extends StatefulWidget {
  @override
  _BookingCalendarPageState createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  DateTime todayDate = DateTime.now();
  List<DateTime> _selectedDays = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        title: Text('Dates'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Color.fromARGB(255, 240, 240, 240),
                    blurRadius: 3,
                  ),
                ],
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) {
                    List<String> Days = [
                      'Sat',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sun',
                    ];
                    return Text(
                      Days[index],
                      style: TextStyle(fontSize: 16, color: Colors.black45),
                    );
                  },
                ),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            ListView.builder(
              itemCount: 12,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (BuildContext context, int index) {
                final focusedDay =
                    DateTime.now().add(Duration(days: index * 30));
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Text(
                        DateFormat('MMMM y').format(focusedDay),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    sizedBox(height * 0.02, 0.0),
                    TableCalendar(
                      rowHeight: height * 0.07,
                      headerVisible: false,
                      daysOfWeekVisible: false,
                      firstDay: todayDate,
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: focusedDay,
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      selectedDayPredicate: (day) {
                        return _selectedDays.contains(day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (selectedDay.isBefore(todayDate)) return;
                        setState(() {
                          if (_selectedDays.contains(selectedDay)) {
                            _selectedDays.remove(selectedDay);
                          } else if(_selectedDays.length < 28){
                            _selectedDays.add(selectedDay);
                          } else{
                            toastmessege('Hotel reservations are limited to a maximum duration of 28 days');
                          }
                        });
                      },
                      onPageChanged: (focusedDay) {
                        // Nothing to do here
                      },
                      calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(color: Colors.black),
                        todayDecoration:
                            BoxDecoration(color: Colors.transparent),
                        disabledTextStyle: TextStyle(color: Colors.black),
                        selectedDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 41, 41, 41),
                        ),
                        outsideDaysVisible: false,
                      ),
                      availableGestures: AvailableGestures.all,
                    ),
                    sizedBox(height * 0.03, 0.0),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: height * 0.095,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: primarycolor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select',
                  style: whiteSmallTextStyle,
                ),
                sizedBox(0.0, width * 0.02),
                _selectedDays.length > 1?
                Text(
                  DateFormat.MMM().format(_selectedDays[0]) == DateFormat.MMM().format(_selectedDays[0])?
                  '${DateFormat.d().format(_selectedDays[0])} - ${DateFormat.MMMd().format(_selectedDays.last)}':
                  '${DateFormat.MMMd().format(_selectedDays[0])} - ${DateFormat.MMMd().format(_selectedDays.last)}',
                  style: whiteSmallTextStyle,
                ): SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
