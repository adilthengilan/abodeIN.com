import 'dart:async';
import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/dashBoard/top_destination/top_destination.dart';
import 'package:abodein/src/view/room_controling/room_controller_screen.dart';
import 'package:abodein/src/view/search_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:flutter/material.dart';
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.06, vertical: height * 0.02),
                  child: Consumer<DashBoardProvider>(
                    builder: (context, dash, child) => InkWell(
                      onTap: () {
                        if (isBooked && !isCheking) {
                          setState(() {
                            isCheking = !isCheking;
                          });
                        } else if (isBooked &&
                            isCheking &&
                            !dash.isTimeStarted) {
                          setState(() {
                            dash.isTimeStarted = !dash.isTimeStarted;
                          });
                        } else if (isBooked &&
                            isCheking &&
                            dash.isTimeStarted) {
                              dash.startTimer();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomController(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: width,
                        height: height * 0.09,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 202, 202, 202),
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            isBooked && !isCheking
                                ? "Smart Cheking"
                                : isBooked && isCheking && !dash.isTimeStarted
                                    ? "Time Start At 2:00 Pm"
                                    : isBooked &&
                                            isCheking &&
                                            dash.isTimeStarted
                                        ? dash.formatTime(dash.seconds)
                                        : "",
                            style: mediumTextStyleLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                isBooked && isCheking && dbProvider.isTimeStarted
                    ? SizedBox(
                        height: height * 0.165,
                        child: CategoryLayoutRow(height, width),
                      )
                    : SizedBox(),
                //==================================================== The Category Horizontal List With List Generator wrap with Wrap Widget
                sizedBox(height * 0.01, 0.0),
                SizedBox(
                  height: height * 0.29,
                  width: width,
                  //================================================================= ListView Builder ============================================
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        // Square Box Under The Categories List with Hotel Image And it Details
                        SquereBoxWithImages(width, height),
                        //=========================================================== Rating Icon & Text ===========================================
                        RatingBoxTransparant(
                          height: height,
                          width: width,
                          rating: 4.8,
                          top: height * 0.015,
                          left: width * 0.02,
                        ),
                        //=========================================================== 3D View TransParant Box =======================================
                        ThreeDView(
                          top: height * 0.015,
                          right: width * 0.06,
                          onTap: () {},
                          height: height,
                          width: width,
                        ),
                        // This Class Price $ Booking Person Count, and it passing Bottom positioned,left Positione,Right Positioned, City Name, Location Of Hotel, Price of Hotel and person count
                        PriceAndBookingPersons(
                          bottom: height * 0.015,
                          left: width * 0.04,
                          right: width * 0.075,
                          city: "Bankok",
                          location: "Phuket",
                          price: 599,
                          personCount: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.03, 0.0),
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
                sizedBox(height * 0.015, 0.0),
                //==================================================== ListView Builder ========= Top Destination ==============================================
                HotelBoxList(
                  itemCount: 6,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: "assets/images/getstart_image.jpg",
                  rating: 4.8,
                  description:
                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                  location: "Dubai",
                )
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
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
    return Padding(
      padding: EdgeInsets.only(right: width * 0.04),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelDetailePage(),
            ),
          );
        },
        child: Container(
          width: width * 0.58,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/getstart_image.jpg"),
            ),
            color: shadeColor,
            borderRadius: BorderRadius.circular(25),
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
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  const RatingBoxTransparant({
    super.key,
    required this.height,
    required this.width,
    required this.rating,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
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
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(city, style: whiteSmallTextStyle),
              Text(location, style: whiteMediumTextStyle)
            ],
          ),
          RichText(
            text: TextSpan(
              text: "\$${price}",
              style: whiteMediumTextStyle,
              children: [
                TextSpan(
                  text: "/${personCount}Persons",
                  style: whiteLightTextStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// it shows A Transparant Box Of 3d View, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar
class ThreeDView extends StatelessWidget {
  final double top;
  final double right;
  final VoidCallback onTap;
  final double height;
  final double width;
  const ThreeDView({
    super.key,
    required this.top,
    required this.right,
    required this.onTap,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: InkWell(
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
      ),
    );
  }
}

//This Class Shows The Map View Of The Hotel, It a button, and it Passing height, width, top, left by Parameter
class MapViewButton extends StatelessWidget {
  final double height;
  final double width;
  final double top;
  final double left;
  const MapViewButton({
    super.key,
    required this.height,
    required this.width,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
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
      ),
    );
  }
}

class AlertBox extends StatelessWidget {
  final String titleAlert;
  final String yourAlert;
  final String buttontext;
  final VoidCallback onpressed;
  const AlertBox({
    super.key,
    required this.titleAlert,
    required this.yourAlert,
    required this.buttontext,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(titleAlert, style: mediumTextStyleLight),
      content: Text(yourAlert, style: smallTextStyle),
      actions: <Widget>[
        TextButton(
          child: Text("Cancel", style: smallTextStyle),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: onpressed,
          child: Text(buttontext, style: smallTextStyle),
        ),
      ],
    );
  }
}
