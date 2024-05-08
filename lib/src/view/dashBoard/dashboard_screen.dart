import 'package:abodein/src/view/hotel_details_screen.dart/hotel_details_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final DashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);

    TextEditingController searchBarController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Location", style: smallTextStyle),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 20, color: primarycolor),
                            sizedBox(0.0, 5.0),
                            Text("Kerala, India", style: smallTextStyle)
                          ],
                        ),
                      ],
                    ),
                    Image(
                      height: height * 0.06,
                      image: AssetImage("assets/images/account_circle.png"),
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              sizedBox(height * 0.03, 0.0),
              AppSearchBar(
                controller: searchBarController,
                hintText: "Search",
                width: width,
                height: height,
              ),
              sizedBox(height * 0.04, width),
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: Text("Categories", style: mediumTextStyleLight),
              ),
              sizedBox(height * 0.015, 0.0),
              categoriesList(
                width,
                height,
                DashboardProvider.categories,
                () {},
              ),
              sizedBox(height * 0.04, 0.0),
              headingAndSeeAllButton(width, "Suggestions For You"),
              sizedBox(10.0, 0.0),
              SuggestionsForYouRow(
                width,
                height,
                DashboardProvider.SuggestionsHotel,
              ),
              sizedBox(height * 0.03, 0.0),
              headingAndSeeAllButton(width, "Popular Hotels"),
              sizedBox(10.0, 0.0),
              PopularHotelscolumn(
                width,
                height,
                DashboardProvider.popularHotels,
              ),
            ],
          ),
        ),
      ),
    );
  }

// This Method is To Display "See all" Button in the DashBoard Every where
  Widget headingAndSeeAllButton(width, text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: mediumTextStyleLight),
          Text(
            "See all",
            style: smallTextStyle,
          )
        ],
      ),
    );
  }

  Widget SuggestionsForYouRow(width, height, suggestionsHotel) {
    return SizedBox(
      width: width,
      height: height * 0.29,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        scrollDirection: Axis.horizontal,
        itemCount: suggestionsHotel.length,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailePage(
                      images: suggestionsHotel[index].image,
                      hotelName: suggestionsHotel[index].name,
                      location: suggestionsHotel[index].location,
                      price: suggestionsHotel[index].price,
                      rating: suggestionsHotel[index].rating,
                    ),
                  ),
                );
              },
              child: Container(
                height: height * 0.280,
                width: width * 0.488,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyShadeLight,
                ),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(suggestionsHotel[index].image[0]),
                ),
              ),
            ),
            Positioned(
              top: height * 0.188,
              left: width * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(suggestionsHotel[index].name,
                      style: whiteMediumTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 20,
                        color: backgroundColor,
                      ),
                      sizedBox(0.0, 5.0),
                      Text(
                        suggestionsHotel[index].name,
                        style: whiteSmallTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    "\$${suggestionsHotel[index].price}/Night",
                    style: whiteSmallTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// this Method is List Which Type of Stay Rooms in the App, Displaying The Categories by a row
//It has A image and a text and its Scrollable
  Widget categoriesList(width, height, categoryList, ontap) {
    return SizedBox(
      width: width,
      height: height * 0.058,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: ontap,
          child: Container(
            height: height * 0.056,
            width: width * 0.36,
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
                color: blueColorShadeLight,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.01,
                      top: height * 0.006,
                      right: width * 0.01),
                  child: Image(
                    image: AssetImage(
                      categoryList[index]["image"],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.2,
                  child: Center(
                    child: Text(
                      categoryList[index]["Name"],
                      style: smallTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// this method showing Popular Hotels List in the Screen
  Widget PopularHotelscolumn(
    width,
    height,
    popularHotels,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      scrollDirection: Axis.vertical,
      itemCount: popularHotels.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelDetailePage(
                images: popularHotels[index].image,
                hotelName: popularHotels[index].name,
                location: popularHotels[index].location,
                price: popularHotels[index].price,
                rating: popularHotels[index].rating,
              ),
            ),
          );
        },
        child: Container(
          height: height * 0.225,
          width: 312,
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: greyShadeLight,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                fit: BoxFit.fill,
                image: AssetImage(
                  popularHotels[index].image[0],
                ),
              ),
              Positioned(
                top: height * 0.16,
                left: width * 0.05,
                right: width * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularHotels[index].name,
                          style: whiteMediumTextStyle,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: backgroundColor,
                              size: 20,
                            ),
                            Text(
                              popularHotels[index].location,
                              style: whiteSmallTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 14,
                              color: orangeColor,
                            ),
                            sizedBox(0.0, 10.0),
                            Text("${popularHotels[index].rating}",
                                style: whiteSmallTextStyle)
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: "\$${popularHotels[index].price}",
                            style: whiteSmallTextStyle,
                            children: [
                              TextSpan(
                                text: "/Night",
                                style: whiteLightTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
