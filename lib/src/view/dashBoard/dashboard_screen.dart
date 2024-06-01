import 'dart:async';
import 'package:abodein/src/view/booking/calendar.dart';
import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/dashBoard/top_destination/top_destination.dart';
import 'package:abodein/src/view/search_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_location_search/flutter_location_search.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  bool isBooked = true;
  bool isCheking = false;
  String locationText = "London";

  int seconds = 22 * 60 * 60; // 24 hours in seconds
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final dbProvider = Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SilverAppBar(width, height),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // ============================================================= Samrt Cheking Button and Timer with functionality ====================================
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //       horizontal: width * 0.06, vertical: height * 0.02),
                //   child: Consumer<DashBoardProvider>(
                //     builder: (context, dash, child) {
                //       isBooked ? dash.startTimer(19, 29) : () {};
                //       return InkWell(
                //         onTap: () {
                //           if (isBooked && !isCheking) {
                //             setState(() {
                //               isCheking = !isCheking;
                //             });
                //           } else if (isBooked &&
                //               isCheking &&
                //               !dash.isTimeStarted) {
                //             setState(() {
                //               dash.isTimeStarted = !dash.isTimeStarted;
                //             });
                //           } else if (isBooked &&
                //               isCheking &&
                //               dash.isTimeStarted) {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => RoomController(),
                //               ),
                //             );
                //           }
                //         },
                //         child: Container(
                //           width: width,
                //           height: height * 0.09,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Color.fromARGB(255, 202, 202, 202),
                //                 blurRadius: 2,
                //                 blurStyle: BlurStyle.outer,
                //                 spreadRadius: 3,
                //               )
                //             ],
                //           ),
                //           child: Center(
                //             child: Text(
                //               isBooked && !isCheking
                //                   ? "Smart Cheking"
                //                   : isBooked && isCheking && !dash.isTimeStarted
                //                       ? "Time Start At 2:00 Pm"
                //                       : isBooked &&
                //                               isCheking &&
                //                               dash.isTimeStarted
                //                           ? dash.formatTime(dash.seconds)
                //                           : "",
                //               style: mediumTextStyleLight,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                isBooked && isCheking && dbProvider.isTimeStarted
                    ? SizedBox(
                        height: height * 0.165,
                        child: CategoryLayoutRow(height, width),
                      )
                    : SizedBox(),
                //==================================================== The Category Horizontal List With List Generator wrap with Wrap Widget
                sizedBox(height * 0.01, 0.0),
                //========================================================== Hotel small Square Boxes ========================================
                SquereBoxWithImages(width, height),
                sizedBox(height * 0.01, 0.0),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.04,
                    right: width * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //======================================================== Top Destination ========================================
                      Text("Top Destination", style: largeTextStyle),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TopDestination(),
                            ),
                          );
                        },
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.095,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: backgroundColor,
                            border:
                                Border.all(color: greyShadeLight, width: 0.5),
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
                ),
                sizedBox(height * 0.01, 0.0),
                //==================================================== ListView Builder ========= Top Destination ==============================================
                HotelBoxList(
                  itemCount: 6,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: "assets/images/getstart_image.jpg",
                  rating: 4.8,
                  city: 'Palace',
                  description:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                  location: "Dubai",
                ),
                sizedBox(height * 0.02, width),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Text(
                    'Reviews',
                    style: mediumTextStyle,
                  ),
                ),
                // ============================================================= Reviews Horizontal List =====================================================================
                ReviewsBox(width, height),
                sizedBox(height * 0.4, 0.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // Silver App Bar for Customization, Utilize This Method Floatable AppBar and It Has a Title, Search Icon and Notification Icon
  Widget SilverAppBar(width, height) {
    return SliverAppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookingCalendarPage(),
              ),
            );
          },
          icon: Icon(Icons.menu)),
      //====================================================== Silver App Bar For Customization, I make this AppBar Floatable
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      floating: true,
      toolbarHeight: height * 0.09,
      title: Text(
        locationText,
        // "Discover",
        style: whiteMediumTextStyle,
      ),
      actions: [
        //================================================================= Search Icon ==========================================
        Consumer<DashBoardProvider>(
          builder: (context, value, child) => InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () async {
              LocationData? locationData = await LocationSearch.show(
                context: context,
                lightAdress: true,
                mode: Mode.fullscreen,
                language: 'en',
                iconColor: greyShadeMedium,
                historyMaxLength: 5,
                searchBarTextColor: shadeColor,
              );
              value.setLocationAddress(locationData!.address);
            },
            child: CircleAvatar(
              radius: height * 0.032,
              backgroundColor: shadeColor,
              child: Center(
                child: AppIcon(
                  iconData: Icons.location_on_outlined,
                  color: greyShadeDark,
                  height: height * 0.03,
                ),
              ),
            ),
          ),
        ),
        sizedBox(0.0, width * 0.015),
        //================================================================= Search Button ==========================================
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchScreen(),
              ),
            );
          },
          child: CircleAvatar(
            radius: height * 0.032,
            backgroundColor: shadeColor,
            child: Center(
              child: AppIcon(
                iconData: Icons.search_rounded,
                color: greyShadeDark,
                height: height * 0.03,
              ),
            ),
          ),
        ),
        sizedBox(0.0, width * 0.015),
        //================================================================ Notification Icon =========================================
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: CircleAvatar(
            radius: height * 0.032,
            backgroundColor: shadeColor,
            child: Center(
              child: AppIcon(
                iconData: Icons.notifications_outlined,
                color: greyShadeDark,
                height: height * 0.03,
              ),
            ),
          ),
        ),
        sizedBox(0.0, width * 0.04),
      ],
    );
  }

  //This Method shows category Layout Button, it Implement with wrap Widget
  Widget CategoryLayoutRow(height, width) {
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Wrap(
          spacing: width * 0.06,
          children: List.generate(
            dashboardProvider.categories.length,
            (index) => SizedBox(
              child: CategoryTextButtons(
                height,
                width,
                index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // This an category Box with container and it looks like button, when clicked the Button change the color of the button to Black
  Widget CategoryTextButtons(
    height,
    width,
    index,
  ) {
    return Consumer<DashBoardProvider>(
      builder: (context, dash, child) => InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          dash.setCategoryButtonColor(index);
          //This Method is changing Button Color with Index
        },
        child: Column(
          children: [
            sizedBox(height * 0.01, 0.0),
            Container(
              height: height * 0.13,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
              ),
              decoration: BoxDecoration(
                boxShadow: dash.selectedCategoryIndex == index
                    ? [
                        BoxShadow(
                            color: Color.fromARGB(255, 202, 202, 202),
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 5)
                      ]
                    : [
                        BoxShadow(
                            color: Color.fromARGB(255, 246, 246, 246),
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 5)
                      ],
                // white shade color
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  sizedBox(height * 0.015, 0.0),
                  Icon(
                    Icons.flight,
                    size: 40,
                  ),
                  sizedBox(height * 0.02, 0.0),
                  Text(
                    dash.categories[index],
                    style: smallTextStyle,
                    // Black text Style
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This Method Shows A Square Buttons with images, it Listing Hotels
  Widget SquereBoxWithImages(width, height) {
    return SizedBox(
      height: height * 0.46,
      width: width,
      //================================================================= ListView Builder ============================================
      child: ListView.builder(
        itemCount: 4,
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
                      fit: BoxFit.fitWidth,
                      image: AssetImage('assets/images/cdt4nlrq.png'),
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
                            style: smallTextStyle,
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
          horizontal: width * 0.03,
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
                          style: smallTextStyle,
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
            Text(city, style: smallTextStyle),
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
