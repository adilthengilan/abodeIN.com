import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/dashBoard/drawer/drawer_screen.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/dashBoard/search_page/search_page.dart';
import 'package:abodein/src/view/searchapi.dart';
import 'package:abodein/src/view_model/booking_func.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String locationText = "London";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: DrawerScreen(),
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SilverAppBar(width, height),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                //==================================================== The Category Horizontal List With List Generator wrap with Wrap Widget
                // Consumer<BookingFuncProvider>(
                //   builder: (context, value, child) => SizedBox(
                //       height: value.bookingconfirm == true
                //           ? height * 0.165
                //           : height * 0.04,
                //       child: value.bookingconfirm == true
                //           ? CategoryLayoutRow(height, width)
                //           : Container()),
                // ),
                Row(
                  children: [
                    sizedBox(0.0, width * 0.05),
                    Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.32,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'SMART CONTROL',
                                    style: GoogleFonts.poppins(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image.asset(
                                      'assets/images/smart icon nav.png'))
                            ],
                          ),
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 148, 208, 255),
                              Color.fromARGB(255, 102, 74, 172)
                            ]),
                          ),
                        ),
                        sizedBox(height * 0.01, 0.0),
                        Container(
                          height: 80,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(193, 120, 24, 204),
                                Color.fromARGB(73, 138, 104, 205)
                              ])),
                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.25,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'TRAVEL REWARD',
                                    style: GoogleFonts.poppins(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                      'assets/images/reward icon nav.png'))
                            ],
                          ),
                        )
                      ],
                    ),
                    sizedBox(0.0, width * 0.02),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Smart check-IN (3).png',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(10, 234, 252, 255),
                            Color.fromARGB(255, 247, 244, 255)
                          ], begin: Alignment.topCenter)),
                      height: height * 0.21,
                      width: width * 0.38,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'SMART ROOM',
                          //   style: GoogleFonts.poppins(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.w700,
                          //       fontSize: 25),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
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
                          top: height * 0.020,
                          left: width * 0.020,
                        ),
                        //=========================================================== 3D View TransParant Box =======================================
                        ThreeDView(
                          top: height * 0.020,
                          right: width * 0.06,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SerpApiPage(),
                                ));
                          },
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
                      Text("Top Destination",
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.w700)),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
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
                ListView.builder(
                  itemCount: 5,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: height * 0.02),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HotelDetailePage(),
                                ));
                          },
                          child: Container(
                            height: height * 0.3,
                            width: width,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 214, 214, 214),
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/getstart_image.jpg')),
                              color: shadeColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                      ),
                      //======================================================= Map View Button ===========================================
                      MapViewButton(
                        height: height,
                        width: width,
                        top: height * 0.015,
                        left: width * 0.03,
                      ),
                      //======================================================= Rating Icon & Text ===========================================
                      RatingBoxTransparant(
                        top: height * 0.015,
                        right: width * 0.31,
                        height: height,
                        width: width,
                        rating: 4.8,
                      ),
                      //================================================== 3D View Transparant Box ============================================
                      ThreeDView(
                        top: height * 0.015,
                        right: width * 0.03,
                        onTap: () {},
                        height: height,
                        width: width,
                      ),
                      //================================================== Price $ Booking Person Count ===================================
                      PriceAndBookingPersons(
                        bottom: height * 0.038,
                        left: width * 0.04,
                        right: width * 0.04,
                        city: "Bankok",
                        location: "phuket",
                        price: 589,
                        personCount: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Silver App Bar for Customization, Utilize This Method Floatable AppBar and It Has a Title, Search Icon and Notification Icon
  Widget SilverAppBar(width, height) {
    return SliverAppBar(
      //====================================================== Silver App Bar For Customization, I make this AppBar Floatable
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
      floating: true,
      toolbarHeight: height * 0.09,
      title: Text(
        locationText,
        // "Discover",
        style: smallTextStylewhite,
      ),
      actions: [
        //================================================================= Search Icon ==========================================
        Consumer<DashBoardProvider>(
          builder: (context, value, child) => InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () async {
              // LocationData? locationData = await LocationSearch.show(
              //   context: context,
              //   lightAdress: true,
              //   mode: Mode.fullscreen,
              //   language: 'en',
              //   iconColor: greyShadeMedium,
              //   historyMaxLength: 10,
              //   searchBarTextColor: shadeColor,
              // );
              // value.setLocationAddress(locationData!.address);
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
                  builder: (context) => SearchPage(),
                ));
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
  Widget CategoryLayoutRow(
    height,
    width,
  ) {
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                    SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(dash.categories[index]['image'])),
                    sizedBox(height * 0.02, 0.0),
                    Text(
                      dash.categories[index]['Name'],
                      style: smallTextStyleblack,
                      // Black text Style
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  // This Method Shows A Square Buttons with images, it Listing Hotels
  Widget SquereBoxWithImages(width, height) {
    return Padding(
      padding:
          EdgeInsets.only(right: width * 0.04, top: 10, bottom: 10, left: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HotelDetailePage(),
              ));
        },
        child: Container(
          width: width * 0.58,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 214, 214, 214),
                  blurRadius: 5,
                  spreadRadius: 1)
            ],
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/getstart_image.jpg"),
            ),
            color: shadeColor,
            borderRadius: BorderRadius.circular(18),
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
          color: IcontransparantColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(height * 0.006),
          child: Row(
            children: [
              CircleAvatar(
                radius: height * 0.022,
                backgroundColor: IcontransparantColor,
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
          SizedBox(
            width: 60,
            child: RichText(
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
          )
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
            color: IcontransparantColor,
          ),
          child: Padding(
            padding: EdgeInsets.all(height * 0.006),
            child: Row(
              children: [
                CircleAvatar(
                  radius: height * 0.022,
                  backgroundColor: IcontransparantColor,
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
          color: IcontransparantColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(height * 0.0055),
          child: Row(
            children: [
              CircleAvatar(
                radius: height * 0.022,
                backgroundColor: IcontransparantColor,
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
