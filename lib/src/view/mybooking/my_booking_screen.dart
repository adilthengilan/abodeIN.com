import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/tab_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final myBookings = Provider.of<MyBookingsProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              appBar(height, width),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: myBookings.bookings.length,
                itemBuilder: (context, index) {
                  return MyBookingCard(booking: myBookings.bookings[index]);
                },
              ),
            ],
          ),
        ));
  }

  Widget appBar(
    height,
    width,
  ) {
    return Container(
      height: height * 0.270,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 4,
            color: Color.fromARGB(255, 228, 228, 228),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 4,
            color: Color.fromARGB(255, 216, 216, 216),
          ),
        ],
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 255, 207, 163),
          Color.fromARGB(255, 252, 252, 215),
        ]),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40),
        ),
      ),
      //................................................ appbar ........................................................
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: height * 0.04, left: width * 0.03, right: width * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: blackShadeColor,
                ),
                Text('MyBooking', style: mediumTextStyle),
                Icon(Icons.notifications_active_outlined,
                    color: blackShadeColor),
              ],
            ),
          ),
          //....................................................................................................................
          //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Tabs change>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.04),
            child: Container(
              height: height * 0.10,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(-0.3, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: greyShadeDark
                      // color: darktheme
                      //     ? Color.fromARGB(255, 165, 223, 254)
                      //     : Color.fromARGB(255, 248, 248, 248),
                      ),
                ],
              ),
              child: Column(
                children: [
                  Consumer<MyBookingsProvider>(
                    builder: (context, provider, child) {
                      return Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => provider.setSelectedIndex(0),
                              child: Column(
                                children: [
                                  Icon(Icons.event_available_outlined,
                                      color: provider.selectedIndex == 0
                                          ? Color.fromARGB(255, 11, 146, 29)
                                          : Colors.grey),
                                  Text(
                                    'Upcoming',
                                    style: TextStyle(
                                        color: provider.selectedIndex == 0
                                            ? Color.fromARGB(255, 4, 180, 28)
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => provider.setSelectedIndex(1),
                              child: Column(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: provider.selectedIndex == 1
                                          ? Color.fromARGB(255, 18, 191, 194)
                                          : Colors.grey),
                                  Text(
                                    'Past',
                                    style: TextStyle(
                                        color: provider.selectedIndex == 1
                                            ? Color.fromARGB(255, 18, 191, 194)
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => provider.setSelectedIndex(2),
                              child: Column(
                                children: [
                                  Icon(Icons.cancel,
                                      color: provider.selectedIndex == 2
                                          ? Color.fromARGB(255, 157, 45, 14)
                                          : Colors.grey),
                                  Text(
                                    'Cancelled',
                                    style: TextStyle(
                                        color: provider.selectedIndex == 2
                                            ? Color.fromARGB(255, 157, 45, 14)
                                            : Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        ],
      ),
    );
  }
}

///////////////////////  BOOKING CARD INCLUDES HOTELNAME,BOOKING ID ,CHECKIN CHEKOUT DATE,PRICE,ETC.......................
class MyBookingCard extends StatelessWidget {
  final Map<String, dynamic> booking;

  const MyBookingCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: width * 0.04, right: width * 0.04, top: height * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 0,
                color: greyShadeDark
                // color: darktheme
                //     ? Color.fromARGB(255, 165, 223, 254)
                //     : Color.fromARGB(255, 248, 248, 248),
                ),
          ],
        ),
        height: height * 0.350,
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: height * 0.14,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(booking['hotelImage']),
                            fit: BoxFit.fill),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(booking['hotelName'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Booking ID: ${booking['bookingId']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 4),
                        Text('Status: ${booking['status']}',
                            style: TextStyle(
                                fontSize: 14,
                                color: booking['status'] == 'confirmed'
                                    ? Colors.green
                                    : Colors.red)),
                      ],
                    ),
                  ),
                ],
              ),
              sizedBox(height * 0.02, width),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check-in:', style: smallTextStyleSemiBold),
                        Text('${booking['checkInDate']}',
                            style: smallTextStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check-out:', style: smallTextStyleSemiBold),
                        Text('${booking['checkOutDate']}',
                            style: smallTextStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Guest:', style: smallTextStyleSemiBold),
                        Text('${booking['guestName']}', style: smallTextStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Room Type:', style: smallTextStyleSemiBold),
                        Text('${booking['roomType']}', style: smallTextStyle),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Cost:', style: smallTextStyleSemiBold),
                        Text('${booking['totalCost']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),

              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text('View Details'),
              //     Padding(
              //       padding: EdgeInsets.only(right: width * 0.03),
              //       child:
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
