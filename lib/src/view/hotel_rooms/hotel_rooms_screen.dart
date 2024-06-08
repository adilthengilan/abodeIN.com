import 'package:abodein/src/view/Booking/booking.dart';
import 'package:abodein/src/view/Booking/calender.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/calender_provider.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HotelRoomsScreen extends StatelessWidget {
  const HotelRoomsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;

    return Scaffold(
      //----------------------------------------------- APP BAR --------------------------------------------------------
      appBar: AppBar(
        surfaceTintColor: backgroundColor,
        backgroundColor: backgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text(
          'Grand Royal Hotel',
          style: mediumTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.favorite_border_sharp),
          )
        ],
      ),
      //---------------------------------------------------------------------------------------------------------------
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //----------------------- Here is we can change the selected date ,rooms,and guests .--------------------------------------------------------------
              sizedBox(height * 0.03, 0.0),
              roomBookingDetailes(height, width,
                  context), //It Shows How many Rooms are available and its Rooms Category, and The Date of Booking Date
              sizedBox(height * 0.04, 0.0),
              // ---------------------------------------------------------- CHOOSE YOUR ROOM---------------------------
              Text("Choose Your Room", style: mediumTextStyle),
              Text("Showing 2 of 2 rooms",
                  style: smallTextStyle), // AVAILABLE ROOMS COUNT
              sizedBox(height * 0.03, 0.0),
              //------------------------------------------------------------Here Listing The Room Type With ListView Builder------------
              //------------------------------------------------------------Showing Images of The Room, Listing Room Facilities----------
              //------------------------------------------------------------This Box Contains "Images" of The Room, And in "room Facilities" like wifi, Price" and "Book Now Button"
              theRoomDetailes(height, width, context),
            ],
          ),
        ),
      ),
    );
  }

//---------------------------------------------------------------------------------------------------------------------------------
  // It Shows How many Rooms are available, and The Date of Booking Date
  // The first Box Of The Rooms Screen To Show Booking Date And Vacating Date, And How many people are User booking for?,
  // And Room Count, The Category Of Poaples Adult or Childrens,
  Widget roomBookingDetailes(
    height,
    width,
    context,
  ) {
    final bottomSheet = Provider.of<DashBoardProvider>(context, listen: false);
    return Container(
      height: height * 0.150,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: greyShadeLight),
      ),
      child: Column(
        children: [
          bookingDateAndVacatingDate(height, width,
              context), // The Date of Boking and Vacating, This shows on The first Row of Container on the Screen, and it shows calender icon and Dates
          sizedBox(height * 0.015, 0.0),
          Divider(),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.06,
              top: height * 0.01,
              right: width * 0.06,
            ),
            child: Row(
              children: [
                //---------------------------------------------------- How many rooms are Booking -------------------------------------
                GestureDetector(
                    onTap: () {
                      showBottomSheet(context);

                      // showBottomSheet(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return BottomSheetContent();
                      //     });
                    },
                    child:
                        Icon(Icons.people_alt_outlined, color: greyShadeDark)),
                sizedBox(0.0, width * 0.02),
                Text('${bottomSheet.rooms} Rooms', style: smallTextStyle),
                sizedBox(0.0, width * 0.02),
                Icon(Icons.circle, size: 6, color: greyShadeDark),
                sizedBox(0.0, width * 0.02),
                Text(
                  ' ${bottomSheet.adults} Adults, ${bottomSheet.children} children',
                  style: smallTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//========================================================================================================
//================================ This Bottom Sheet func for Pick persons Count ==========================
//=========================================================================================================
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: backgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }

// The Date of Boking and Vacating, This shows on The first Row of Container on the Screen, and it shows calender icon and Dates
  Widget bookingDateAndVacatingDate(height, width, context) {
    final calendarProvider = Provider.of<CalendarProvider>(context);

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.06,
        top: height * 0.02,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookingCalendarPage()));
            },
            child: Icon(
              Icons.calendar_today_outlined, // -------------- Calender Icon
              color: greyShadeDark,
            ),
          ),
          sizedBox(0.0, width * 0.02),
          Text(
              calendarProvider.selectedDates.isEmpty
                  ? 'Choose Your Dates'
                  : '${calendarProvider.checkingDate} - ${calendarProvider.checkoutDate}  ${calendarProvider.selectedDates.length - 1} Night',
              style: smallTextStyle),
        ],
      ),
    );
  }

//-Here Listing The Room Type With ListView Builder
//-Displaying Images of The Room, Listing Available in the like Wifi, etc...
//-This Box Contains Images of The Room, And in-room Facilities like wifi and Its Price and Book Now Button
  Widget theRoomDetailes(height, width, context) {
    final roomsprovider =
        Provider.of<HotelRoomsProvider>(context, listen: false);
    // final bottomSheet =
    //             Provider.of<DashBoardProvider>(context, listen: false);
    return ListView.builder(
      //----------------------------------------------------------Listview Builder ----------------------------------------
      shrinkWrap: true,
      itemCount: roomsprovider.roomType.length,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        width: width,
        margin: EdgeInsets.only(bottom: height * 0.03),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(-0.3, 1),
                blurRadius: 2,
                blurStyle: BlurStyle.normal,
                spreadRadius: 1,
                color: greyShadeLight
                // color: darktheme
                //     ? Color.fromARGB(255, 165, 223, 254)
                //     : Color.fromARGB(255, 248, 248, 248),
                ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/The Image of Choose Your Room.png"), //-------------------- Room Images
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          20,
                        ),
                        topLeft: Radius.circular(20)))),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.02,
                left: width * 0.06,
              ),
              child: Text(
                  "${roomsprovider.roomType[index]}", //--------------------- The Type Of Room like PREMIUM, STANDARD etc...
                  style: mediumTextStyle),
            ),

            Padding(
              padding: EdgeInsets.only(
                left: width * 0.06,
              ),
              child: Row(
                children: [
                  Text(
                    "\$598", //The Price of the Rooms-------------------
                    style: mediumTextStyleLight,
                  ),
                  Text("/Night", style: smallTextStyle), // per Night

                  // _moreDetails(height, width)
                ],
              ),
            ),
            // ExpansionPanelList(),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: backgroundColor,
              ),
              child: ExpansionTile(
                title: Text('Room Details'),
                controlAffinity: ListTileControlAffinity.leading,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.06,
                    ),
                    child: Column(
                      //------------------------------------- Listing Room Facilities with List Generator its legth is List Room Details -----------------------
                      children: List.generate(
                        roomsprovider.roomsDetails.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: height * 0.0095),
                          child: Row(
                            children: [
                              Icon(
                                roomsprovider.roomsDetails[index]
                                        ["Icon"] // -Room facilities Icons
                                    as IconData?,
                                color: greyShadeDark,
                                size: height * 0.025,
                              ),
                              sizedBox(0.0, width * 0.025),
                              Text(
                                '${roomsprovider.roomsDetails[index]["Service"]}', // Room facilities
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(height * 0.02),
              child: AppTextButton(
                  //---Book Now Buttoon in the Box-----------------------------
                  text: "Book Now",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Booking()));
                  },
                  height: height,
                  width: width,
                  gradient: LinearGradient(colors: [
                    Color(0xfff6d365),
                    Color(0xfffda085),
                  ])),
            ),
          ],
        ),
      ),
    );
  }

  //******************************** MORE DETAILS ****************************** */
  Widget _moreDetails(height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "More Details",
          style: smallTextStyle,
          textAlign: TextAlign.center,
        ),
        Icon(
          Icons.arrow_drop_down,
          color: greyShadeLight,
        ),
      ],
    );
  }
}
