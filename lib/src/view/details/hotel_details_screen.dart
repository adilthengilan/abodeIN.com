import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/hotel_rooms/hotel_rooms_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/bookingfun_provider.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';

import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HotelDetailePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final detailpageProvider =
        Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor,
      //----------------------------------------------------------------------------- APPBAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: blackShadeColor,
              size: 30,
            )),
        title: Center(
          child: Text(
            'Details',
            style: mediumTextStyle,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: width * 0.01),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 30,
                  color: blackShadeColor,
                )),
          ),
        ],
      ),
      //-----------------------------------------------------------------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=======================  hotel image=======================================
            //============================================================================
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.40,
                width: width * 0.990,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/Screenshot 2024-05-31 145706.png',
                        ),
                        fit: BoxFit.fill)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //===================================================== favourite button =========================================
                      //                       here marking a hotel as favorite or removing from favorites
                      //================================================================================================================
                      Container(
                        margin: EdgeInsets.all(20),
                        height: height * 0.04,
                        width: width * 0.08,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: backgroundColor,
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
                        child: GestureDetector(
                            onTap: () {
                              detailpageProvider.setfavoriteButton();
                            },
                            child: Icon(
                              detailpageProvider.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            )),
                      ),
                    ]),
              ),
            ),
            //=====================================================================================================================================
            sizedBox(height * 0.01, width),
            //----------------------------------------------------------------------------------------------------------------------------------
            //==================================================  Amenities
            SizedBox(
                width: width,
                height: height * 0.10,
                child: Center(child: _amenitiesList(height, width))),
            //------------------------------------------------------------------------------------------------------------------------------------------
            Container(
              width: width * 0.880,
              child: PriceAndBooking(
                city: "Bankok",
                location: "phuket",
                price: 589,
                personCount: 4,
                description:
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
              ),
            ),
            //-------------------------------------------------- LOCATION AND SEE MAP WIDELY---------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Location", style: blackMediumTextStyle),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "See map",
                            style: smallTextStyle,
                          ),
                        )
                      ],
                    ),
                    sizedBox(height * 0.01, width),
                    LocationOfTheHotel(width, height),
                    //--------------------------------------------------------------------------------------------------------------------------------------------
                    //------------------------------------------ SEE REVIEWS OF THE USERS ------------------------------------------------------------------------
                    sizedBox(height * 0.045, 0.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reviews", style: blackMediumTextStyle),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "See all reviews",
                            style: smallTextStyle,
                          ),
                        )
                      ],
                    ),
                    reviewsOfUSers(height, detailpageProvider, width),
                    sizedbox(height * 0.01, width),
                  ],
                  //--------------------------------------------------------------------------------------------------------------------------------------------------
                ),
              ),
            ),
          ],
        ),
      ),
      //===========================================================================================================================================
      //                                                 swipe for booking
      //===========================================================================================================================================

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 70,
            child: SlideToUnlock(),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-0.3, 1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: Color.fromARGB(255, 14, 107, 174),
                    // color: darktheme
                    //     ? Color.fromARGB(255, 165, 223, 254)
                    //     : Color.fromARGB(255, 248, 248, 248),
                  ),
                ],
                // boxShadow: [
                //   BoxShadow(
                //       color: Color.fromARGB(255, 209, 209, 209),
                //       blurRadius: 10,
                //       spreadRadius: 10)
                // ],
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(
                //     color: Color.fromARGB(255, 14, 107,
                //         174), // Converted from #48c6ef (starting color)
                //     width: 2),
                color: Color.fromARGB(255, 255, 255, 255)
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Color.fromARGB(255, 255, 243, 132),
                //     Color.fromARGB(240, 240, 236, 154)
                //   ],
                // ),
                )),
      ),
    );
  }

  // //******************************** MORE DETAILS ****************************** */
  // Widget _moreDetails(height, width) {
  //   return Container(
  //     height: height * 0.035,
  //     width: width * 0.30,
  //     padding: EdgeInsets.only(right: width * 0.02),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(25),
  //       color: transparantColor,
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Text(
  //           "More Details",
  //           style: whiteSmallTextStyle,
  //           textAlign: TextAlign.center,
  //         ),
  //         Icon(
  //           Icons.arrow_drop_down,
  //           color: backgroundColor,
  //         ),
  //       ],
  //     ),
  //   );
  // }
//------------------------------------------------------  AMENITIESLIST  WIDGET -----------------------------------------------------------
  Widget _amenitiesList(height, width) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        // physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          IconData icon = Icons.abc;
          String text = '';
          Color color = Colors.transparent;
          VoidCallback onPressed = () {};
          switch (index) {
            case 0:
              icon = Icons.wifi;
              text = 'Free Wifi';
              color = Color.fromARGB(198, 232, 75, 64);

            case 1:
              icon = Icons.directions_car_sharp;
              text = 'Parking';
              color = orangeColor;

            case 2:
              icon = Icons.free_breakfast_outlined;
              text = 'Luandry ';
              color = Color.fromARGB(217, 223, 86, 132);
            case 3:
              icon = Icons.local_laundry_service_outlined;
              color = Color.fromARGB(199, 103, 81, 227);
              text = 'Room ';

            default:
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: height * 0.06,
                width: width * 0.17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: color,
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
                child: Center(
                  child: Icon(
                    icon,
                    color: backgroundColor,
                    size: 30,
                  ),
                ),
              ),
              Container(
                width: width * 0.24,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        });
  }
  //----------------------------------------------------------------------------------------------------------------------------------------------------------------

  // this method is Displaying Location of the hotel by connecting with google map
// and it has an only images just a location
  Widget LocationOfTheHotel(width, height) {
    return Row(
      children: [
        Container(
          height: height * 0.150,
          width: width * 0.300,
          decoration: BoxDecoration(
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
          child: Image(
            image: AssetImage("assets/images/locationMapimage.png"),
            fit: BoxFit.cover,
          ),
        ),
        sizedBox(0.0, 15.0),
        SizedBox(
          height: height * 0.100,
          width: width * 0.5,
          child: Center(
            child: Text(
              "Maradu, Cochin, Ernakulam, Kochi, India 682304",
              style: smallTextStyle,
            ),
          ),
        ),
      ],
    );
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  // this method is listings reviews of users , reviews are listing with listview builder and its itemcout is image legth thats just for temparory
// and in this reviews have only one name and only reviews
  Widget reviewsOfUSers(height, detailpageProvider, width) {
    return ListView.builder(
      padding: EdgeInsets.only(top: height * 0.01),
      // physics: NeverScrollableScrollPhysics(),
      itemCount: detailpageProvider.reviewrsPersonsImage.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        width: width * 0.100,
        padding: EdgeInsets.all(height * 0.01),
        margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
            color: backgroundColor,
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
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: width * 0.07,
              child: Image.asset(
                detailpageProvider.reviewrsPersonsImage[index],
              ),
            ),
            sizedBox(0.0, 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Henry, Arthur",
                  style: smallTextStyle,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => ratingStarIcon(height),
                  ),
                ),
                SizedBox(
                  width: width * 0.60,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                    style: smallTextStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// Rating star
  Widget ratingStarIcon(height) {
    return Icon(
      Icons.star,
      color: orangeColor,
      size: height * 0.02,
    );
  }

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
  Future<bool> checkLoginStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool('isLogin') ?? false;
  }

  void book(context) {
    // Your booking logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Booking successful')),
    );
  }
}

//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
// it shows A Transparant Box Of Rating, It Has Rating Icon and a Rating Text, And The Icon show on the circle Avatar
class Rating extends StatelessWidget {
  final double height;
  final double width;
  final double rating;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  const Rating({
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
    return Row(
      children: [
        Center(
          child: AppIcon(
            iconData: Icons.star,
            color: Color.fromARGB(255, 255, 247, 4),
            height: height * 0.030,
          ),
        ),
        sizedbox(0.0, width * 0.0035),
        Text("${rating}", style: BlackLightTextStyle),
      ],
    );
  }
}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//This Class show Hotel price, Location and Booking for how many Persons
class PriceAndBooking extends StatelessWidget {
  final String city;
  final String location;
  final int price;
  final int personCount;
  final String description;
  const PriceAndBooking({
    super.key,
    required this.city,
    required this.location,
    required this.price,
    required this.personCount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------------------------------------- city and location ---------------------------------------
                Container(child: Text(city, style: blackMediumTextStyle)),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Color.fromARGB(255, 24, 74, 105),
                      size: 20,
                    ),
                    Text(location, style: smallTextStyle)
                  ],
                ),
              ],
            ),
            //=========================== price and persons==============================
            Row(
              children: [
                Text(
                  "\$${price}",
                  style: smallboldTextStyle,
                ),
                Text(
                  "/${personCount}Persons",
                )
              ],
            )
          ],
        ),
        sizedBox(height * 0.02, width),
        //--------------------------------------------- description -------------------------------------------
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Description',
                style: blackMediumTextStyle,
              ),
            ),
            Row(
              children: [
                Container(
                  width: width * 0.865,
                  child: Text(
                    description,
                    style: smallTextStyle,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-----------------Slide to book button with its functions and logic here.-----------------
class SlideToUnlock extends StatefulWidget {
  @override
  _SlideToUnlockState createState() => _SlideToUnlockState();
}

class _SlideToUnlockState extends State<SlideToUnlock> {
  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Consumer<BookingFuncProvider>(
      builder: (context, value, child) => GestureDetector(
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            _position += details.primaryDelta!;
            if (_position < 0) {
              _position = 0;
            } else if (_position > MediaQuery.of(context).size.width - 130) {
              // Adjust 100 according to the width of your unlock button
              _position = MediaQuery.of(context).size.width - 130;
            }
          });
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          if (_position >= MediaQuery.of(context).size.width - 200) {
            // Unlock logic here, e.g., navigating to a new screen
            value.confirmBooking();
            print('Unlocked!');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HotelRoomsScreen()));
          }
          setState(() {
            _position = 0.0;
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.01,
          height: 100,
          child: Stack(
            children: [
              Row(
                children: [
                  sizedBox(height, width * 0.25),
                  Text(
                    "Book Now",
                    style: GoogleFonts.poppins(
                        color: blackShadeColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  sizedBox(height, width * 0.20),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: greyShadeLight,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: greyShadeMedium,
                  ),
                ],
              ),
              Positioned(
                left: _position,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft, // Starting point (left side)
                      end: Alignment.centerRight, // Ending point (right side)
                      colors: [
                        Color.fromARGB(255, 28, 153,
                            215), // Converted from #48c6ef (starting color)
                        Color.fromARGB(255, 26, 135, 186),
                        // Color(
                        //     0xff96deda), // Converted from #96deda (starting color)
                        // Color(
                        //     0xff50c9c3), // Converted from #50c9c3 (ending color)
                      ],
                    ), // color: Color.fromARGB(255, 13, 97, 140),
                  ),
                  margin: EdgeInsets.only(
                    top: 3,
                    left: 5,
                    bottom: 9,
                  ),
                  width: 60,
                  height: 60,
                  child: Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: backgroundColor,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
