import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/dashBoard/drawer/drawer_screen.dart';
import 'package:abodein/src/view/dashBoard/events/events_page.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/booking/calendar.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/dashBoard/location_searching.dart';
import 'package:abodein/src/view/dashBoard/top_destination.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:abodein/src/view_model/calendar.dart';
import 'package:abodein/src/view_model/events_api_connecting/hotels_api_connecting.dart';
import 'package:abodein/src/view_model/features_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isBooked = true;
  bool isCheking = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bools = Provider.of<boolsProvider>(context);
    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SilverAppBar(width, height, bools),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                sizedBox(height * 0.01, 0.0),
                //========================================================== Hotel small Square Boxes ========================================
                SizedBox(
                    width: width / 2,
                    child: LocationDatePersonCountBox(height, width, bools)),
                sizedBox(height * 0.04, 0.0),
                //=============================================== Top Destination Heading And See More Button ==============================================
                headingAndSeeMoreButton(
                  'Top Destination',
                  GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                  width,
                  height,
                  () {
                    //============================================ Navigatig to Top Destination Page =============================================
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TopDestination(),
                    //   ),
                    // );
                    Scaffold.of(context).openDrawer();
                  },
                ),
                sizedBox(height * 0.006, 0.0),
                //================================================= Top Destination Hotesls List Horizontally ==============================================
                HotelBoxList(
                  itemCount: 6,
                  scrollDirectionVertical: false,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: Imagess,
                  rating: 4.8,
                  city: 'Palace',
                  description:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                  location: "Dubai",
                ),
                sizedBox(height * 0.03, 0.0),
                //================================================= Events Heading and See more Button =================================
                headingAndSeeMoreButton(
                  'Events',
                  GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                  width,
                  height,
                  () {
                    //============================================= implement Navigation ========================================================
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventsPage(
                          height: height,
                          width: width,
                        ),
                      ),
                    );
                  },
                ),
                sizedBox(height * 0.01, 0.0),
                //=================================================== Listing Events Horizontally ==============================================
                eventsList(width, height),
                sizedBox(height * 0.02, 0.0),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Text(
                    'Explore',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                sizedBox(height * 0.01, 0.0),

                //==================================================== Listing Hotels Ads =======================================================
                adsBoxRow(height, width, context),
                sizedBox(height * 0.03, 0.0),
                //==================================================== Reviews Heading And See More Button ==============================================
                headingAndSeeMoreButton(
                  'Reviews',
                  GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                  width,
                  height,
                  () {
                    //============================================= implement Navigation ========================================================
                  },
                ),
                // ============================================================= Reviews Horizontal List =====================================================================
                ReviewsBox(width, height),
                sizedBox(height * 0.2, 0.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Silver App Bar for Customization, Utilize This Method Floatable AppBar and It Has a Title, Search Icon and Notification Icon
  Widget SilverAppBar(width, height, bools) {
    return SliverAppBar(
      expandedHeight: 1.1,
      // leading: IconButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => DrawerScreen()),
      //     );
      //   },
      //   icon: Icon(IconlyBold.category),
      // ),
      //====================================================== Silver App Bar For Customization, I make this AppBar Floatable
      surfaceTintColor: Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.background,
      floating: true,
      toolbarHeight: height * 0.08,
      leading: Builder(
        builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Stack(children: [
            AppIcon(
              iconData: Icons.notifications,
              color: Color.fromARGB(255, 191, 194, 255),
              height: height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.045),
              child: CircleAvatar(
                radius: height * 0.007,
                child: Center(
                  child: Text(
                    '0',
                    style: TextStyle(color: Colors.black, fontSize: 6),
                  ),
                ),
              ),
            )
          ]),
        ),
        sizedBox(0.0, width * 0.04),
      ],
    );
  }

//This has Location searcher, Choose Your Dates, How many persons booking
//Its in a Container with BoxShadow the provided a column
//In the Column Has 3 Containers and a AppTextButton
//The Three container are indicates, Location searcher, Choosing Dates, Room Count and Persons Count
  Widget LocationDatePersonCountBox(height, width, bools) {
    final bottomProvider =
        Provider.of<DashBoardProvider>(context, listen: false);
    bottomProvider.loadRoomsAndGuestCount();
    bottomProvider.loadlocationText();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 163, 238, 255),
            Color.fromARGB(255, 252, 215, 249),
          ],
        ),
        boxShadow: [
          BoxShadow(
              offset: Offset(3, 2),
              blurRadius: 10,
              color:
                  //  bools.isDarkMode
                  //     ? Color.fromRGBO(52, 53, 53, 1)
                  //     : Color.fromARGB(255, 216, 216, 216),
                  Theme.of(context).colorScheme.secondary),
          BoxShadow(
              offset: Offset(-2, -0),
              spreadRadius: 0.5,
              blurRadius: 10,
              color:
                  // bools.isDarkMode
                  //     ? Color.fromRGBO(52, 53, 53, 1)
                  //     : Color.fromARGB(255, 216, 216, 216),
                  Theme.of(context).colorScheme.secondary),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer4<DashBoardProvider, CalendarProvider, FeaturesProvider,
              HotelsConnectingApi>(
            builder: (context, dashBoardProvider, calendarProvider,
                featuresProvider, HotelsApi, child) {
              return Column(
                children: List.generate(
                  3,
                  (index) {
                    IconData icon = Icons.circle;
                    String text = "";
                    Color iconColor = Colors.black;
                    VoidCallback onpressed = () {};
                    switch (index) {
                      case 0:
                        icon = Icons.search;
                        text = featuresProvider.locationText == ''
                            ? 'Where would you like to go?'
                            : featuresProvider.locationText;
                        iconColor = Colors.blueAccent;
                        onpressed = () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationSearchScreen(),
                              ));
                        };
                      case 1:
                        icon = Icons.calendar_today_outlined;
                        text = calendarProvider.selectedDates.isEmpty
                            ? 'Choose Your Dates'
                            : '${calendarProvider.checkingDate} - ${calendarProvider.checkoutDate}  ${calendarProvider.selectedDates.length - 1} Night';
                        iconColor = Colors.pinkAccent;
                        onpressed = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingCalendarPage(),
                            ),
                          );
                        };
                      case 2:
                        icon = Icons.person_outline_outlined;
                        text =
                            '${dashBoardProvider.rooms} Rooms, ${dashBoardProvider.adults} Adults, ${dashBoardProvider.children} children';
                        iconColor = Colors.black54;
                        onpressed = () {
                          showBottomSheet(context, height, width);
                        };
                        break;
                      default:
                    }
                    return InkWell(
                      onTap: onpressed,
                      child: Container(
                        height: height * 0.083,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                          color: Colors.transparent,
                        ),
                        child: Row(
                          children: [
                            AppIcon(
                              iconData: icon,
                              color: iconColor,
                              height: height * 0.04,
                            ),
                            sizedBox(0.0, width * 0.04),
                            SizedBox(
                                width: width * 0.65,
                                child: Text(text,
                                    style: smallTextStyleblack, maxLines: 1)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Consumer4<DashBoardProvider, HotelsConnectingApi,
                CalendarProvider, FeaturesProvider>(
              builder: (context, value, HotelsApi, Calendar, Features, child) =>
                  AppTextButton(
                text: "Search",
                onPressed: () {
                  HotelsApi.searchHotels(Features.locationText,
                      Calendar.checkingDate, Calendar.checkoutDate);
                },
                color: [
                  Color.fromARGB(255, 51, 192, 252),
                  Color.fromARGB(255, 22, 228, 251)
                ],
                height: height,
                width: width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//========================================================================================================
//================================ This Bottom Sheet func for Pick persons Count ==========================
//=========================================================================================================
void showBottomSheet(BuildContext context, height, width) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
    backgroundColor: backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BottomSheetContent(height: height, width: width);
    },
  );
}

class BottomSheetContent extends StatelessWidget {
  final double height;
  final double width;
  const BottomSheetContent({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final bottomSheet = Provider.of<DashBoardProvider>(context, listen: false);
    final bools = Provider.of<boolsProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        color: bools.isDarkMode ? Colors.black : Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.045, vertical: height * 0.02),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select Rooms and Guests',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: bools.isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Consumer<DashBoardProvider>(
                builder: (context, bottomsheet, child) =>
                    buildDropdown('Rooms', bottomsheet.rooms, (value) {
                  bottomsheet.setRoomCount(value);
                }, bools),
              ),
              Consumer<DashBoardProvider>(
                builder: (context, bottomSheet, child) =>
                    buildDropdown('Adults', bottomSheet.adults, (value) {
                  bottomSheet.setAdultsCount(value);
                }, bools),
              ),
              Consumer<DashBoardProvider>(
                builder: (context, bottomSheet, child) =>
                    buildDropdown('Children', bottomSheet.children, (value) {
                  bottomSheet.setChildrenCount(value);
                }, bools),
              ),
              sizedBox(height * 0.02, 0.0),
              if (bottomSheet.children > 0) ..._buildChildrenAges(context),
              sizedBox(height * 0.02, 0.0),
              Text(
                'To get the best prices and options, please tell us how many children you have and how old they are.',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              sizedBox(height * 0.02, 0.0),
              Consumer<DashBoardProvider>(
                builder: (context, bottomsheet, child) => AppTextButton(
                  text: 'Submit',
                  color: [
                    Color.fromARGB(255, 51, 192, 252),
                    Color.fromARGB(255, 22, 228, 251)
                  ],
                  onPressed: () {
                    bottomsheet.submitingRoomsGuestCount(context);
                  },
                  height: height,
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildDropdown(String label, int value, ValueChanged onChanged, bools) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 18.0,
              color: bools.isDarkMode ? Colors.white : Colors.black),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: DropdownButton<int>(
              value: value,
              onChanged: onChanged,
              items: List.generate(60, (index) => index)
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString().padLeft(2, '0')),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ),
  );
}

List<Widget> _buildChildrenAges(context) {
  final bottomSheet = Provider.of<DashBoardProvider>(context);
  List<Widget> childrenAgesWidgets = [];
  for (int i = 0; i < bottomSheet.children; i++) {
    childrenAgesWidgets.add(
      Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Child ${i + 1} Age',
              style: TextStyle(fontSize: 18.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Consumer<DashBoardProvider>(
                builder: (context, guest, child) => DropdownButton<int>(
                    value: guest.childrenAges[i],
                    onChanged: (int? newValue) {
                      guest.setChildrenAges(newValue, i);
                    },
                    items: List.generate(18, (index) => index)
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString().padLeft(2, '0')),
                      );
                    }).toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
  return childrenAgesWidgets;
}

//================================================================================================================
//=================================== Heading And see More button ================================================
////==============================================================================================================
Widget headingAndSeeMoreButton(String heading, TextStyle textStyle, width,
    height, VoidCallback onpressed) {
  return Padding(
    padding: EdgeInsets.only(
      left: width * 0.04,
      right: width * 0.05,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //======================================================== Heading ========================================
        Text(heading, style: textStyle),
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onpressed,
          child: Container(
            height: height * 0.05,
            width: width * 0.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: backgroundColor,
              border: Border.all(color: greyShadeLight, width: 0.5),
            ),
            // =========================================================== View all Button ====================================
            child: Center(
              child: AppIcon(
                iconData: Icons.arrow_forward,
                color: greyShadeDark,
                height: height * 0.028,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

// This Method Shows A Square Buttons with images, it Listing Hotels
Widget eventsList(width, height) {
  List images = [
    'assets/images/Events_4.png',
    'assets/images/Events_3.png',
    'assets/images/Events_!.png',
    'assets/images/Events_2.png',
  ];
  return SizedBox(
    height: height * 0.28,
    width: width,
    //================================================================= ListView Builder ============================================
    child: ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(
        right: width * 0.04,
        left: width * 0.04,
        top: height * 0.01,
        bottom: height * 0.025,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          right: width * 0.05,
        ),
        child: Container(
          width: width * 0.8,
          padding: EdgeInsets.only(left: width * 0.02, bottom: height * 0.01),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 227, 227, 227),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: Offset(3, 2),
                  blurRadius: 10,
                  color:
                      //  bools.isDarkMode
                      //     ? Color.fromRGBO(52, 53, 53, 1)
                      //     : Color.fromARGB(255, 216, 216, 216),
                      Theme.of(context).colorScheme.secondary),
              BoxShadow(
                  offset: Offset(-2, -0),
                  spreadRadius: 0.5,
                  blurRadius: 10,
                  color:
                      // bools.isDarkMode
                      //     ? Color.fromRGBO(52, 53, 53, 1)
                      //     : Color.fromARGB(255, 216, 216, 216),
                      Theme.of(context).colorScheme.secondary),
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(images[index]),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shangri-La-Istanbul',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: height * 0.025,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'Ticket Price \$${199}',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget adsBoxRow(height, width, context) {
  return SizedBox(
    height: height * 0.335,
    width: width,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 10),
        child: Row(
          children: List.generate(
            4,
            (index) {
              List images = [
                'assets/images/ads_4.png',
                'assets/images/ads_3.png',
                'assets/images/ads_!.png',
                'assets/images/ads_2.png',
              ];
              return Padding(
                padding: EdgeInsets.only(right: width * 0.04),
                child: Container(
                  width: width * 0.44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3, 2),
                          blurRadius: 10,
                          color:
                              //  bools.isDarkMode
                              //     ? Color.fromRGBO(52, 53, 53, 1)
                              //     : Color.fromARGB(255, 216, 216, 216),
                              Theme.of(context).colorScheme.secondary),
                      BoxShadow(
                          offset: Offset(-2, -0),
                          spreadRadius: 0.5,
                          blurRadius: 10,
                          color:
                              // bools.isDarkMode
                              //     ? Color.fromRGBO(52, 53, 53, 1)
                              //     : Color.fromARGB(255, 216, 216, 216),
                              Theme.of(context).colorScheme.secondary),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(images[index]),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

Widget ReviewsBox(double width, double height) {
  return SizedBox(
    height: height * 0.2,
    width: width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.018,
      ),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(right: width * 0.04),
        child: Container(
          width: width * 0.93,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 10),
                blurRadius: 8,
                color: Color.fromARGB(47, 80, 79, 79),
              ),
              BoxShadow(
                offset: Offset(-4, -1),
                blurRadius: 8,
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      AssetImage('assets/images/reviewers_person_2.png'),
                ),
                sizedBox(0.0, width * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Smith',
                      style: smallTextStyleSemiBold,
                    ),
                    StarRating(
                      rating: 4.5,
                      height: height * 0.024,
                    ),
                    sizedBox(height * 0.005, 0.0),
                    SizedBox(
                      width: width * 0.6,
                      child: Text(
                        'The hotel booking app offers a seamless, modern user experience,.',
                        style: smallTextStyleblack,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

// it shows A Transparant Box Of Rating, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar
class RatingBoxTransparant extends StatelessWidget {
  final double height;
  final double width;
  final double rating;
  const RatingBoxTransparant({
    super.key,
    required this.height,
    required this.width,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.053,
      padding: EdgeInsets.only(right: width * 0.025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: transparantColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(height * 0.006),
        child: Row(
          children: [
            CircleAvatar(
              radius: height * 0.022,
              backgroundColor: transparantColor,
              child: Center(
                child: AppIcon(
                  iconData: Icons.star_border_outlined,
                  color: backgroundColor,
                  height: height * 0.022,
                ),
              ),
            ),
            sizedBox(0.0, width * 0.0035),
            Text("${rating}", style: whiteLightTextStyle),
          ],
        ),
      ),
    );
  }
}

//This Class show Hotel price, Location and Booking for how many Persons
class PriceAndBookingPersons extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final String city;
  final String location;
  final int price;
  final int personCount;
  const PriceAndBookingPersons({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.city,
    required this.location,
    required this.price,
    required this.personCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(city, style: smallTextStyleblack),
            Text(location, style: mediumTextStyle)
          ],
        ),
        SizedBox(
          child: Column(
            children: [
              Text("\$${price}", style: mediumTextStyleLight),
              Text("/${personCount}Persons"),
            ],
          ),
        ),
      ],
    );
  }
}

// it shows A Transparant Box Of 3d View, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar
class ThreeDView extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  const ThreeDView({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.053,
        padding: EdgeInsets.only(right: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: transparantColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(height * 0.006),
          child: Row(
            children: [
              CircleAvatar(
                radius: height * 0.022,
                backgroundColor: transparantColor,
                child: Center(
                  child: AppIcon(
                    iconData: Icons.share_outlined,
                    color: backgroundColor,
                    height: height * 0.022,
                  ),
                ),
              ),
              sizedBox(0.0, width * 0.0035),
              Text("3D View", style: whiteLightTextStyle)
            ],
          ),
        ),
      ),
    );
  }
}

//This Class Shows The Map View Of The Hotel, It a button, and it Passing height, width, top, left by Parameter
class MapViewButton extends StatelessWidget {
  final double height;
  final double width;
  const MapViewButton({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.0505,
      padding: EdgeInsets.only(right: width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: transparantColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(height * 0.0055),
        child: Row(
          children: [
            CircleAvatar(
              radius: height * 0.022,
              backgroundColor: transparantColor,
              child: Center(
                child: AppIcon(
                  iconData: Icons.map_outlined,
                  color: backgroundColor,
                  height: height * 0.022,
                ),
              ),
            ),
            sizedBox(0.0, width * 0.0035),
            Text("Map", style: whiteLightTextStyle)
          ],
        ),
      ),
    );
  }
}

//==================================================== Rating start =========================================================
class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double height;

  StarRating({
    this.rating = 0.0,
    this.starCount = 5,
    required this.height,
  });

  Widget buildStar(BuildContext context, int index) {
    Widget icon;
    if (index >= rating) {
      icon = AppIcon(
          iconData: Icons.star_border, color: Colors.orange, height: height);
    } else if (index > rating - 1 && index < rating) {
      icon = AppIcon(
        iconData: Icons.star_half,
        color: Colors.orange,
        height: height,
      );
    } else {
      icon = AppIcon(
        iconData: Icons.star,
        color: Colors.orange,
        height: height,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        starCount,
        (index) => buildStar(context, index),
      ),
    );
  }
}

// @override
// void dispose() {
//   timer?.cancel();
//   super.dispose();
// }

// Silver App Bar for Customization, Utilize This Method Floatable AppBar and It Has a Title, Search Icon and Notification Icon
// Widget SilverAppBar(width, height) {
//   return SliverAppBar(
//     // leading: IconButton(
//     //     onPressed: () {
//     //       DrawerScreen();
//     //     },
//     //     icon: Icon(Icons.menu)),
//     //====================================================== Silver App Bar For Customization, I make this AppBar Floatable
//     surfaceTintColor: backgroundColor,
//     backgroundColor: backgroundColor,
//     floating: true,
//     toolbarHeight: height * 0.09,
//     title: Text(
//       locationText,
//       // "Discover",
//       style: whiteMediumTextStyle,
//     ),
//     actions: [
//       //================================================================= Search Icon ==========================================
//       Consumer<DashBoardProvider>(
//         builder: (context, value, child) => InkWell(
//           borderRadius: BorderRadius.circular(50),
//           onTap: () async {
//             // LocationData? locationData = await LocationSearch.show(
//             //   context: context,
//             //   lightAdress: true,
//             //   mode: Mode.fullscreen,
//             //   language: 'en',
//             //   iconColor: greyShadeMedium,
//             //   historyMaxLength: 5,
//             //   searchBarTextColor: shadeColor,
//             // );
//             // value.setLocationAddress(locationData!.address);
//           },
//           child: CircleAvatar(
//             radius: height * 0.032,
//             backgroundColor: shadeColor,
//             child: Center(
//               child: AppIcon(
//                 iconData: Icons.location_on_outlined,
//                 color: greyShadeDark,
//                 height: height * 0.03,
//               ),
//             ),
//           ),
//         ),
//       ),
//       sizedBox(0.0, width * 0.015),
//       //================================================================= Search Button ==========================================
//       InkWell(
//         borderRadius: BorderRadius.circular(50),
//         onTap: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute(
//           //     builder: (context) => SearchScreen(),
//           //   ),
//           // );
//         },
//         child: CircleAvatar(
//           radius: height * 0.032,
//           backgroundColor: shadeColor,
//           child: Center(
//             child: AppIcon(
//               iconData: Icons.search_rounded,
//               color: greyShadeDark,
//               height: height * 0.03,
//             ),
//           ),
//         ),
//       ),
//       sizedBox(0.0, width * 0.015),
//       //================================================================ Notification Icon =========================================
//       InkWell(
//         borderRadius: BorderRadius.circular(50),
//         onTap: () {},
//         child: CircleAvatar(
//           radius: height * 0.032,
//           backgroundColor: shadeColor,
//           child: Center(
//             child: AppIcon(
//               iconData: Icons.notifications_outlined,
//               color: greyShadeDark,
//               height: height * 0.03,
//             ),
//           ),
//         ),
//       ),
//       sizedBox(0.0, width * 0.04),
//     ],
//   );
// }

//This Method shows category Layout Button, it Implement with wrap Widget
// Widget CategoryLayoutRow(BuildContext context, height, width) {
//   final dashboardProvider =
//       Provider.of<DashBoardProvider>(context, listen: false);
//   return SingleChildScrollView(
//     scrollDirection: Axis.horizontal,
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: width * 0.05),
//       child: Wrap(
//         spacing: width * 0.06,
//         children: List.generate(
//           dashboardProvider.categories.length,
//           (index) => SizedBox(
//             child: CategoryTextButtons(
//               height,
//               width,
//               index,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// // This an category Box with container and it looks like button, when clicked the Button change the color of the button to Black
// Widget CategoryTextButtons(
//   height,
//   width,
//   index,
// ) {
//   return Consumer<DashBoardProvider>(
//     builder: (context, dash, child) => InkWell(
//       borderRadius: BorderRadius.circular(30),
//       onTap: () {
//         dash.setCategoryButtonColor(index);
//         //This Method is changing Button Color with Index
//       },
//       child: Column(
//         children: [
//           sizedBox(height * 0.01, 0.0),
//           Container(
//             height: height * 0.13,
//             padding: EdgeInsets.symmetric(
//               horizontal: width * 0.05,
//             ),
//             decoration: BoxDecoration(
//               boxShadow: dash.selectedCategoryIndex == index
//                   ? [
//                       BoxShadow(
//                           color: Color.fromARGB(255, 202, 202, 202),
//                           blurRadius: 5,
//                           blurStyle: BlurStyle.outer,
//                           spreadRadius: 5)
//                     ]
//                   : [
//                       BoxShadow(
//                           color: Color.fromARGB(255, 246, 246, 246),
//                           blurRadius: 5,
//                           blurStyle: BlurStyle.outer,
//                           spreadRadius: 5)
//                     ],
//               // white shade color
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               children: [
//                 sizedBox(height * 0.015, 0.0),
//                 Icon(
//                   Icons.flight,
//                   size: 40,
//                 ),
//                 sizedBox(height * 0.02, 0.0),
//                 Text(
//                   dash.categories[index],
//                   style: smallTextStyleSemiBold,
//                   // Black text Style
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// This Method Shows A Square Buttons with images, it Listing Hotels
Widget SquereBoxWithImages(BuildContext context, width, height) {
  return SizedBox(
    height: height * 0.46,
    width: width,
    //================================================================= ListView Builder ============================================
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelDetailePage(),
            ));
      },
      child: ListView.builder(
        itemCount: Imagess.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.025,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            right: width * 0.05,
          ),
          child: Container(
            width: width * 0.69,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4, 10),
                  blurRadius: 8,
                  color: Color.fromARGB(47, 80, 79, 79),
                ),
                BoxShadow(
                  offset: Offset(-4, -1),
                  blurRadius: 8,
                  color: Color.fromARGB(255, 216, 216, 216),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.22,
                  width: width,
                  margin: EdgeInsets.all(height * 0.018),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Imagess[index]),
                    ),
                  ),
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            // width: width * 0.55,
                            child: Text(
                              "Hotel Niagara Popo",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: width * 0.042,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          sizedBox(height * 0.007, 0.0),
                          Text(
                            'New York, USA',
                            style: smallTextStyleSemiBold,
                          ),
                          sizedBox(height * 0.015, 0.0),
                          Row(
                            children: [
                              Text(
                                '\$1,599',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: width * 0.046,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text("/night"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            child: Column(
                              children: [
                                sizedBox(height * 0.076, 0.0),
                                RatingBoxTransparant(
                                    height: height, width: width, rating: 4.8),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

//   Widget ReviewsBox(double width, double height) {
//     return SizedBox(
//       height: height * 0.2,
//       width: width,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         padding: EdgeInsets.symmetric(
//           horizontal: width * 0.03,
//           vertical: height * 0.018,
//         ),
//         itemBuilder: (context, index) => Padding(
//           padding: EdgeInsets.only(right: width * 0.04),
//           child: Container(
//             width: width * 0.93,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(4, 10),
//                   blurRadius: 8,
//                   color: Color.fromARGB(47, 80, 79, 79),
//                 ),
//                 BoxShadow(
//                   offset: Offset(-4, -1),
//                   blurRadius: 8,
//                   color: Color.fromARGB(255, 216, 216, 216),
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(height * 0.02),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundImage:
//                         AssetImage('assets/images/reviewers_person_2.png'),
//                   ),
//                   sizedBox(0.0, width * 0.04),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'John Smith',
//                         style: smallTextStyleSemiBold,
//                       ),
//                       StarRating(
//                         rating: 4.5,
//                         height: height * 0.024,
//                       ),
//                       sizedBox(height * 0.005, 0.0),
//                       SizedBox(
//                         width: width * 0.6,
//                         child: Text(
//                           'The hotel booking app offers a seamless, modern user experience,.',
//                           style: smallTextStyleSemiBold,
//                           maxLines: 2,
//                           overflow: TextOverflow.clip,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// it shows A Transparant Box Of Rating, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar

// class RatingBoxTransparant extends StatelessWidget {
//   final double height;
//   final double width;
//   final double rating;
//   const RatingBoxTransparant({
//     super.key,
//     required this.height,
//     required this.width,
//     required this.rating,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height * 0.053,
//       padding: EdgeInsets.only(right: width * 0.025),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: transparantColor,
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(height * 0.006),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: height * 0.022,
//               backgroundColor: transparantColor,
//               child: Center(
//                 child: AppIcon(
//                   iconData: Icons.star_border_outlined,
//                   color: backgroundColor,
//                   height: height * 0.022,
//                 ),
//               ),
//             ),
//             sizedBox(0.0, width * 0.0035),
//             Text("${rating}", style: whiteLightTextStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }

//This Class show Hotel price, Location and Booking for how many Persons
// class PriceAndBookingPersons extends StatelessWidget {
//   final double? top;
//   final double? left;
//   final double? right;
//   final double? bottom;
//   final String city;
//   final String location;
//   final int price;
//   final int personCount;
//   const PriceAndBookingPersons({
//     super.key,
//     this.top,
//     this.left,
//     this.right,
//     this.bottom,
//     required this.city,
//     required this.location,
//     required this.price,
//     required this.personCount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(city, style: smallTextStyleSemiBold),
//             Text(location, style: mediumTextStyle)
//           ],
//         ),
//         SizedBox(
//           child: Column(
//             children: [
//               Text("\$${price}", style: mediumTextStyleLight),
//               Text("/${personCount}Persons"),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// it shows A Transparant Box Of 3d View, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar
// class ThreeDView extends StatelessWidget {
//   final VoidCallback onTap;
//   final double height;
//   final double width;
//   const ThreeDView({
//     super.key,
//     required this.onTap,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: height * 0.053,
//         padding: EdgeInsets.only(right: width * 0.02),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           color: transparantColor,
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(height * 0.006),
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: height * 0.022,
//                 backgroundColor: transparantColor,
//                 child: Center(
//                   child: AppIcon(
//                     iconData: Icons.share_outlined,
//                     color: backgroundColor,
//                     height: height * 0.022,
//                   ),
//                 ),
//               ),
//               sizedBox(0.0, width * 0.0035),
//               Text("3D View", style: whiteLightTextStyle)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//This Class Shows The Map View Of The Hotel, It a button, and it Passing height, width, top, left by Parameter
// class MapViewButton extends StatelessWidget {
//   final double height;
//   final double width;
//   const MapViewButton({
//     super.key,
//     required this.height,
//     required this.width,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height * 0.0505,
//       padding: EdgeInsets.only(right: width * 0.02),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: transparantColor,
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(height * 0.0055),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: height * 0.022,
//               backgroundColor: transparantColor,
//               child: Center(
//                 child: AppIcon(
//                   iconData: Icons.map_outlined,
//                   color: backgroundColor,
//                   height: height * 0.022,
//                 ),
//               ),
//             ),
//             sizedBox(0.0, width * 0.0035),
//             Text("Map", style: whiteLightTextStyle)
//           ],
//         ),
//       ),
//     );
//   }
// }

//==================================================== Rating start =========================================================
// class StarRating extends StatelessWidget {
//   final double rating;
//   final int starCount;
//   final double height;

//   StarRating({
//     this.rating = 0.0,
//     this.starCount = 5,
//     required this.height,
//   });

//   Widget buildStar(BuildContext context, int index) {
//     Widget icon;
//     if (index >= rating) {
//       icon = AppIcon(
//           iconData: Icons.star_border, color: Colors.orange, height: height);
//     } else if (index > rating - 1 && index < rating) {
//       icon = AppIcon(
//         iconData: Icons.star_half,
//         color: Colors.orange,
//         height: height,
//       );
//     } else {
//       icon = AppIcon(
//         iconData: Icons.star,
//         color: Colors.orange,
//         height: height,
//       );
//     }
//     return InkResponse(
//       child: icon,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(
//         starCount,
//         (index) => buildStar(context, index),
//       ),
//     );
//   }
// }

List<String> Imagess = [
  'assets/images/download (25).jpeg',
  'assets/images/download (24).jpeg',
  'assets/images/download (26).jpeg',
  'assets/images/download (27).jpeg',
  'assets/images/images (44).jpeg',
  'assets/images/images (45).jpeg'
];
