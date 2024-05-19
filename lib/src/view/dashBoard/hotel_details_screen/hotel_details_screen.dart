import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelDetailePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final detailpageProvider =
    //     Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
//_________________________________________________________________________________________________________________________________
//__________________________________________________________________backgound Image _______________________________________________
//_________________________________________________________________________________________________________________________________
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: Image.file(File(imagePath)),
                image: AssetImage(
                    "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
//___________________________________________________________________________________________________________________________________________
//________________________________________AppBar____________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________________
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.024,
              right: width * 0.04,
              left: width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 55,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      color: backgroundColor),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: primarycolor,
                      )),
                ),
                Container(
                  child: Text(
                    "Details",
                    style: mediumTextStyleLight,
                  ),
                ),
                Row(
                  children: [
                    Consumer<HotelDetailProvider>(
                        builder: (context, value, child) {
                      return Container(
                        height: 50,
                        width: 55,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(30),
                            color: backgroundColor),
                        child: GestureDetector(
                            onTap: () {
                              value.setfavoriteButton();
                              value.isFavorite
                                  ? value.addToFavorite(
                                      "Sheraton Grand Hotel",
                                      "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg",
                                      599,
                                      4.8,
                                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                                    )
                                  : value.removeFromFavorite(
                                      "Sheraton Grand Hotel",
                                      "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg",
                                      599,
                                      4.8,
                                      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                                    );
                            },
                            child: Icon(
                              value.isFavorite
                                  ? Icons.favorite_sharp
                                  : Icons.favorite_border_outlined,
                              color:
                                  value.isFavorite ? Colors.red : primarycolor,
                            )),
                      );
                    }),
                    Container(
                      height: 50,
                      width: 55,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: backgroundColor),
                      child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: primarycolor,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
// __________________________________________________________________________________________________________________________________________________________
//_______________________________________Details Box_________________________________________________________________________________________________________________
//___________________________________________________________________________________________________________________________________________________________
          Container(
            margin: EdgeInsets.only(top: 415, left: 10),
            height: 360,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: transparantColor,
            ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >  Map   >>>>>>>>>>>>>>>>>>>>
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 258),
                  height: height * 0.06,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.map_outlined,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        "Map",
                        style: whiteSmallTextStyle,
                      )
                    ],
                  ),
                ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>ratings>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Container(
                  margin: EdgeInsets.only(
                    bottom: 258,
                    left: 27,
                  ),
                  height: height * 0.06,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text("4.6", style: whiteSmallTextStyle)
                    ],
                  ),
                ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>3D view>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Container(
                  margin: EdgeInsets.only(bottom: 258, right: 10),
                  height: height * 0.07,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.align_vertical_center_rounded,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text("Rooms", style: whiteSmallTextStyle)
                    ],
                  ),
                ),
              ],
            ),
          ),
//_____________________________________________________________________________________________________________________

//SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS start Details From here SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
//_____________________________________________________________________________________________________________________
          Positioned(
            top: height * 0.65,
            left: width * 0.05,
            right: width * 0.075,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bangkok", style: whiteSmallTextStyle),
                        Text("Phuket", style: whiteMediumTextStyle)
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: "\$${599}",
                        style: whiteMediumTextStyle,
                        children: [
                          TextSpan(
                            text: "/${2}Persons",
                            style: whiteSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                    style: whiteLightTextStyle,
                  ),
                ),
                sizedBox(height * 0.1, width)
              ],
            ),
          ),
          Positioned(
              top: height * 0.88,
              left: width * 0.05,
              right: width * 0.075,
              child: Container(
                height: 70,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(167, 214, 212, 212)),
                child: SlideToUnlock(),
              ))
        ],
      ),
    );
  }
}

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
    return GestureDetector(
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
          print('Unlocked!');
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
                      color: Colors.black,
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
                    color: Colors.black),
                margin: EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                width: 60,
                height: 60,
                child: Center(
                    child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
