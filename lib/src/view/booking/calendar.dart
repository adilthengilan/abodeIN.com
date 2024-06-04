import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/room_controling/room_controller_screen.dart';
import 'package:abodein/src/view_Model/calendar_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class BookingCalendarPage extends StatefulWidget {
  @override
  _BookingCalendarPageState createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: width * 0.18,
        leading: Container(
          height: height * 0.053,
          width: width * 0.13,
          margin: EdgeInsets.only(left: width* 0.04,top: height * 0.01,bottom: height * 0.01,),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 3),
                color: Color.fromARGB(47, 80, 79, 79),
              ),
              BoxShadow(
                offset: Offset(-2, -1),
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
        title: Text('Dates',
            style: isDarkMode ? whiteMediumTextStyle : mediumTextStyleLight),
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
                      color: isDarkMode
                          ? Color.fromARGB(255, 24, 24, 24)
                          : Color.fromARGB(255, 240, 240, 240),
                      blurRadius: 3,
                    ),
                  ],
                  color: isDarkMode
                      ? Color.fromARGB(255, 3, 3, 3)
                      : backgroundColor),
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
                    return Text(Days[index],
                        style:
                            isDarkMode ? whiteSmallTextStyle : smallTextStyle);
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
                      child: Text(DateFormat('MMMM y').format(focusedDay),
                          style: isDarkMode
                              ? whiteMediumTextStyle
                              : mediumTextStyleLight),
                    ),
                    sizedBox(height * 0.02, 0.0),
                    Consumer<CalendarProvider>(
                      builder: (context, calendar, child) => TableCalendar(
                        rowHeight: height * 0.07,
                        headerVisible: false,
                        daysOfWeekVisible: false,
                        firstDay: calendar.toDayDate,
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: focusedDay,
                        calendarFormat: CalendarFormat.month,
                        availableCalendarFormats: const {
                          CalendarFormat.month: 'Month',
                        },
                        selectedDayPredicate: (day) {
                          return calendar.selectedDates.contains(day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          calendar.onSelected(selectedDay, context);
                        },
                        calendarStyle: CalendarStyle(
                          todayTextStyle:
                              isDarkMode ? whiteSmallTextStyle : smallTextStyle,
                          todayDecoration:
                              BoxDecoration(color: Colors.transparent),
                          rangeEndTextStyle: whiteLargeTextStyle,
                          disabledTextStyle: TextStyle(color: Colors.grey),
                          defaultTextStyle:
                              isDarkMode ? whiteSmallTextStyle : smallTextStyle,
                          weekendTextStyle:
                              isDarkMode ? whiteSmallTextStyle : smallTextStyle,
                          selectedDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromARGB(255, 78, 246, 162),
                                Color.fromARGB(255, 73, 204, 211),
                              ],
                            ),
                          ),
                          outsideDaysVisible: false,
                        ),
                        availableGestures: AvailableGestures.all,
                      ),
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
        height: height * 0.11,
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 66, 230, 148),
                Color.fromARGB(255, 59, 178, 184),
              ],
            ),
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
                sizedBox(0.0, width * 0.03),
                Provider.of<CalendarProvider>(context, listen: false)
                            .selectedDates
                            .length >
                        1
                    ? Row(
                        children: [
                          Consumer<CalendarProvider>(
                            builder: (context, calendar, child) => Text(
                              DateFormat.MMM()
                                          .format(calendar.selectedDates[0]) ==
                                      DateFormat.MMM()
                                          .format(calendar.selectedDates.last)
                                  ? '${DateFormat.d().format(calendar.selectedDates[0])} - ${DateFormat.d().format(calendar.selectedDates.last)}  ${DateFormat.MMM().format(calendar.selectedDates.last)} ,'
                                  : '${DateFormat.d().format(calendar.selectedDates[0])} ${DateFormat.MMM().format(calendar.selectedDates[0])}  - ${DateFormat.d().format(calendar.selectedDates.last)} ${DateFormat.MMM().format(calendar.selectedDates.last)} ,',
                              style: whiteSmallTextStyle,
                            ),
                          ),
                          sizedBox(0.0, width * 0.02),
                          Consumer<CalendarProvider>(
                            builder: (context, calendar, child) => Text(
                              "${calendar.selectedDates.length - 1}",
                              style: whiteSmallTextStyle,
                            ),
                          ),
                          sizedBox(0.0, width * 0.02),
                          AppIcon(
                            iconData: Icons.nights_stay,
                            color: Colors.white,
                            height: height * 0.025,
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
