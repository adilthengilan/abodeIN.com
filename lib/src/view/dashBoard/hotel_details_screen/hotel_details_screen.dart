import 'package:abodein/src/view/booking/calendar.dart';
import 'package:abodein/src/view/common_Widgets/show_dialogue.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
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
    final detailpageProvider =
        Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: _appBar(context, height, width),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sizedBox(height * 0.38, width),
              Container(
                height: 300,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: lighTraansparantColor),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 17, right: 17),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //======================================================= Map & Map View ===========================================
                          MapViewButton(
                            height: height,
                            width: width,
                          ),
                          Spacer(),
                          //======================================================= Rating Icon & Text ===========================================
                          RatingBoxTransparant(
                            height: height,
                            width: width,
                            rating: 4.8,
                          ),
                          //================================================== 3D View Transparant Box ============================================
                          ThreeDView(
                            onTap: () {},
                            height: height,
                            width: width,
                          ),
                        ],
                      ),
                      sizedBox(height * 0.04, width),
                      //================================================== Price and travellers ============================================
                      PriceAndBookingPersons(
                        bottom: height * 0.038,
                        left: width * 0.500,
                        right: width * 0.04,
                        city: "Bankok",
                        location: "phuket",
                        price: 589,
                        personCount: 4,
                      ),
                      sizedBox(height * 0.03, width),
                      //================================================== Short Details about hotel============================================
                      Container(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                          style: whiteLightTextStyle,
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [],
                      // ),

                      // //================================================== More Details Widget ============================================

                      // Container(
                      //   margin: EdgeInsets.only(left: 200),
                      //   child: _moreDetails(height, width),
                      // ),
                    ],
                  ),
                ),
              ),
              sizedBox(height * 0.01, width),
              Container(
                height: 610,
                width: 370,
                decoration: BoxDecoration(
                    border: Border.all(color: greyShadeLight),
                    borderRadius: BorderRadius.circular(15),
                    color: lighTraansparantColor),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Amenities",
                        style: whiteMediumTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      WhatWeOffer(width, height, detailpageProvider),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location", style: whiteMediumTextStyle),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See map",
                              style: whiteSmallTextStyle,
                            ),
                          )
                        ],
                      ),
                      LocationOfTheHotel(width),
                      sizedBox(height * 0.045, 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews", style: whiteMediumTextStyle),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See all reviews",
                              style: whiteSmallTextStyle,
                            ),
                          )
                        ],
                      ),
                      reviewsOfUSers(height, detailpageProvider, width),
                      sizedBox(height * 0.01, width),
                      // //================================================== Swipeable Button============================================
                      // SwipeableButton(height, width),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SwipeableButton(height, width, context),
        ),
      ),
    );
  }

  //*****************************APP BAR*************************************** */

  Widget _appBar(BuildContext context, height, width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: height * 0.06,
          width: width * 0.11,
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
                color: blackShadeColor,
              )),
        ),
        Container(
          child: Text(
            "Details",
            style: whiteMediumTextStyle,
          ),
        ),
        Row(
          children: [
            Container(
              height: height * 0.06,
              width: width * 0.11,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: backgroundColor,
              ),
              child: Consumer<HotelDetailProvider>(
                builder: (context, detail, child) => GestureDetector(
                  onTap: () {
                    detail.setfavoriteButton();
                    detail.isFavorite
                        ? detail.addToFavorite(
                            "RR INTERNATIONAL",
                            "assets/images/christian-lambert-vmIWr0NnpCQ-unsplash.jpg",
                            599,
                            4.8,
                            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu")
                        : detail.removeFromFavorite(
                            "RR INTERNATIONAL",
                            "assets/images/christian-lambert-vmIWr0NnpCQ-unsplash.jpg",
                            599,
                            4.8,
                            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu");
                  },
                  child: Icon(
                    detail.isFavorite
                        ? Icons.favorite_outlined
                        : Icons.favorite_border_outlined,
                    color: detail.isFavorite ? Colors.red : blackShadeColor,
                  ),
                ),
              ),
            ),
            sizedBox(0.0, width * 0.02),
            Container(
              height: height * 0.06,
              width: width * 0.11,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: backgroundColor,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: blackShadeColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  //********************************SWIPEABLE BUTTON***************************** */

  Widget SwipeableButton(height, width, BuildContext context) {
    return Container(
      height: 60,
      width: 385,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 214, 212, 212)),
      child: Row(
        children: [
//       widget to be dragged____________________________________
          Draggable(
            axis: Axis.horizontal,
            feedback: Container(
              // feedback > the widget that actually gets dragged
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
            ),
            childWhenDragging: Container(
              height: 50,
              width: 50,
              color: Colors.transparent,
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: backgroundColor,
                ),
              ),
            ),
            onDragEnd: (details) {
              showRoundedDialog(
                context,
                width,
                'Smart Checking',
                'Verify your identity with SmartCheck using your ID now!',
                'Cheking',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingCalendarPage(),
                    ),
                  );
                },
              );
            },
          ),

          sizedBox(height, width * 0.07),
          Text(
            "Book Now",
            style: smallTextStyle,
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
    );
  }

  //******************************** MORE DETAILS ****************************** */
  Widget _moreDetails(height, width) {
    return Container(
      width: width * 0.30,
      padding: EdgeInsets.only(right: width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: transparantColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "More Details",
            style: whiteSmallTextStyle,
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: backgroundColor,
          ),
        ],
      ),
    );
  }

  // This method is to Listing icons and services in the hotel like wifi, Bar, Laundry, Ac, and Parking. and it seen under the "What We Offer"
// its listing with List generator
  Widget WhatWeOffer(width, height, detailpageProvider) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
          (index) => Column(
            children: [
              Container(
                width: width * 0.12,
                height: height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: .6, color: transparantColor),
                  color: blackShadeColor,
                ),
                child: Image(
                  image: AssetImage(
                      detailpageProvider.WhatWeOffering[index]["Icon"]!),
                  fit: BoxFit.scaleDown,
                ),
              ),
              sizedBox(4.0, 0.0),
              Center(
                child: Text(
                  "${detailpageProvider.WhatWeOffering[index]["IconName"]}",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: width * 0.03,
                      color: backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // this method is Displaying Location of the hotel by connecting with google map
// and it has an only images just a location
  Widget LocationOfTheHotel(width) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(
            image: AssetImage("assets/images/locationMapimage.png"),
            fit: BoxFit.cover,
          ),
        ),
        sizedBox(0.0, 15.0),
        SizedBox(
          height: 100,
          width: width * 0.5,
          child: Center(
            child: Text(
              "Maradu, Cochin, Ernakulam, Kochi, India 682304",
              style: whiteLightTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  // this method is listings reviews of users , reviews are listing with listview builder and its itemcout is image legth thats just for temparory
// and in this reviews have only one name and only reviews
  Widget reviewsOfUSers(height, detailpageProvider, width) {
    return ListView.builder(
      padding: EdgeInsets.only(top: height * 0.01),
      // physics: NeverScrollableScrollPhysics(),
      itemCount: detailpageProvider.reviewrsPersonsImage.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(height * 0.01),
        margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
            color: transparantColor,
            border: Border.all(width: .8, color: blackShadeColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: width * 0.07,
              backgroundImage: AssetImage(
                detailpageProvider.reviewrsPersonsImage[index],
              ),
            ),
            sizedBox(0.0, 15.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Henry, Arthur",
                  style: whiteSmallTextStyle,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => ratingStarIcon(height),
                  ),
                ),
                SizedBox(
                  width: width * 0.60,
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                      style: whiteSmallTextStyle,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget ratingStarIcon(height) {
    return Icon(
      Icons.star,
      color: orangeColor,
      size: height * 0.02,
    );
  }
}