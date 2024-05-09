import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/hotel_rooms/hotel_rooms_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HotelDetailePage extends StatelessWidget {
  final List<String> images;
  final String hotelName;
  final String location;
  final int price;
  final String? description;
  final double rating;
  const HotelDetailePage({
    super.key,
    required this.images,
    required this.hotelName,
    required this.location,
    required this.price,
    this.description =
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final detailpageProvider =
        Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: height * 0.36,
                      width: width,
                      child: Image(
                        width: width,
                        image: AssetImage(images[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: height * 0.033,
                      left: width * 0.03,
                      right: width * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconsOnTheImage(
                            width * 0.15,
                            height,
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: backgroundColor,
                                size: width * 0.045,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              iconsOnTheImage(
                                width * 0.1,
                                height,
                                IconButton(
                                  onPressed: () {
                                  },
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: backgroundColor,
                                    size: width * 0.045,
                                  ),
                                ),
                              ),
                              sizedBox(0.0, width * 0.03),
                              iconsOnTheImage(
                                width * 0.1,
                                height,
                                IconButton(
                                  onPressed: () {
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    color: backgroundColor,
                                    size: width * 0.045,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            Positioned(
              top: height * 0.33,
              child: Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20),
                    right: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.06,
                    right: width * 0.06,
                    top: height * 0.03,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(hotelName, style: largeTextStyle),
                      sizedBox(height * 0.008, 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: greyShadeMedium,
                            size: height * 0.02,
                          ),
                          sizedBox(0.0, 5.0),
                          Text(location, style: smallTextStyle),
                        ],
                      ),
                      // ------------------------ It Shows Rating of Hotel And Price -----------------------------------
                      Row(
                        children: [
                          ratingStarIcon(height),
                          sizedBox(0.0, 5.0),
                          Text("${rating}", style: smallTextStyle),
                          Spacer(),
                          RichText(
                            text: TextSpan(
                              text: "\$${price}",
                              style: mediumTextStyleSemiBold,
                              children: [
                                TextSpan(text: "/Night", style: smallTextStyle)
                              ],
                            ),
                          ),
                        ],
                      ),
                      //------------------------------------------------------------------------------------------------------
                      sizedBox(height * 0.03, 0.0),
                      descriptionOfTheHotel(width),
                      sizedBox(height * 0.045, 0.0),
                      Text("What We Offer", style: mediumTextStyleSemiBold),
                      sizedBox(height * 0.02, width),
                      // seen this metho has Icons and services like wifi, Ac, Bar
                      WhatWeOffer(width, height, detailpageProvider),
                      sizedBox(height * 0.045, 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Location", style: mediumTextStyleSemiBold),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See map",
                              style: smallTextStyle,
                            ),
                          )
                        ],
                      ),
                      sizedBox(height * 0.01, 0.0),
                      LocationOfTheHotel(width),
                      sizedBox(height * 0.045, 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Reviews", style: mediumTextStyleSemiBold),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Center(
          child: AppTextButton(
            text: "Book Now",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HotelRoomsScreen(height: height, width: width)  //This Button Navigating to Hotel's Rooms Screen, it has seen Every Romms in the Hotel is Visible, and it Passing mediquery Hight And Width by Parameter
                ),
              );
            },
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }

// The icons On the images Like Back button
  Widget iconsOnTheImage(width, height, widget) {
    return Container(
        width: width,
        height: height * 0.045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 255, 255, 255).withOpacity(
              0.5), // Sets the circle background to gray with 50% opacity
        ),
        child: widget);
  }

//  This The Description the hotel, its in a RichText Widget
  Widget descriptionOfTheHotel(width) {
    return RichText(
      text: TextSpan(
        text: description,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: width * 0.044,
            color: Color.fromARGB(255, 75, 75, 75),
          ),
        ),
      ),
    );
  }

// This method is to Listing icons and services in the hotel like wifi, Bar, Laundry, Ac, and Parking. and it seen under the "What We Offer"
// its listing with List generator
  Widget WhatWeOffer(width, height, detailpageProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        5,
        (index) => Column(
          children: [
            Container(
              width: width * 0.15,
              height: height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: .6, color: greyShadeLight),
                color: backgroundColor,
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
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

// this method is Displaying Location of the hotel by connecting with google map
// and it has an only images just a location
  Widget LocationOfTheHotel(width) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.amber,
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
              style: smallTextStyle,
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
      physics: NeverScrollableScrollPhysics(),
      itemCount: detailpageProvider.reviewrsPersonsImage.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        width: width,
        padding: EdgeInsets.all(height * 0.01),
        margin: EdgeInsets.only(bottom: height * 0.02),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: .8, color: primarycolor),
        ),
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
                  style: smallTextStyleSemiBold,
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => ratingStarIcon(height),
                  ),
                ),
                SizedBox(
                  width: width * 0.65,
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
                      style: smallTextStyle,
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
}
