import 'package:abodein/src/utils/app_colors.dart';
import 'package:abodein/src/utils/style.dart';
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
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SilverAppBar(width, height),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                sizedBox(height * 0.025, 0.0),
                //==================================================== The Category Horizontal List With List Generator wrap with Wrap Widget
                CategoryLayoutRow(height, width, dashboardProvider),
                sizedBox(height * 0.03, 0.0),
                SizedBox(
                  height: height * 0.29,
                  width: width,
                  //========================================================= ListView Builder ================================================
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        // Square Box Under The Categories List with Hotel Image And it Details
                        SquereBoxWithImages(width, height),
                        //================================================ Rating Icon & Text ===========================================
                        RatingBoxTransparant(
                          height: height,
                          width: width,
                          rating: 4.8,
                          top: height * 0.015,
                          left: width * 0.02,
                        ),
                        //========================================= 3D View TransParant Box ======================================================
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
                        onTap: (){},
                        child: Container(
                          height: height * 0.05,
                          width: width * 0.095,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: backgroundColor,
                            border: Border.all(color: greyShadeDark),
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
              DashboardProvider.categoryName,
              DashboardProvider.categoryImages,
              (){}
            ),
            sizedBox(height * 0.04, 0.0),
            headingAndSeeAllButton(width, "Suggestions For You"),
            sizedBox(10.0, 0.0),
            SuggestionsForYouRow(
                width,
                height,
                DashboardProvider.SuggestionsHotel,
                () {}),
            sizedBox(height * 0.03, 0.0),
            headingAndSeeAllButton(width, "Popular Hotels"),
            sizedBox(10.0, 0.0),
            PopularHotelscolumn(
              width,
              height,
              DashboardProvider.popularHotels,
              () {},
            ),
          ],
        ),
      ),
    );
  }

  // This an category Box with container and it looks like button, when clicked the Button change the color of the button to Black
  Widget CategoryTextButtons(height, width, index) {
    return Consumer<DashBoardProvider>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          //This Method is changing Button Color with Index
          value.setCategoryButtonColor(index);
        },
        child: Container(
          height: height * 0.0685,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
          ),
          decoration: BoxDecoration(
            color: value.selectedCategoryIndex == index
                ? primarycolor
                : shadeColor, // white shade color
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            //========================================================Category Text
            child: Text(
              value.categories[index],
              style: value.selectedCategoryIndex ==
                      index // when selected button Index and list index is same
                  ? whiteSmallTextStyle // white text  style for selected category button
                  : smallTextStyle, // Black text Style
            ),
          ),
        ),
      ),
    );
  }

  Widget SuggestionsForYouRow(width, height, suggestionsHotel, ontap) {
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
              onTap: ontap,
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
                  image: AssetImage(
                    suggestionsHotel[index].image
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.188,
              left: width * 0.05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lux Hotel", style: whiteMediumTextStyle),
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
                  Text("\$${suggestionsHotel[index].price}/Night",
                      style: whiteSmallTextStyle),
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
  Widget categoriesList(width, height, categoryName, categoryImages,ontap) {
    return SizedBox(
      width: width,
      height: height * 0.058,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        scrollDirection: Axis.horizontal,
        itemCount: categoryName.length,
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
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.01,
                      top: height * 0.006,
                      right: width * 0.01),
                  child: Image(
                    image: AssetImage(
                      categoryImages[index],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.2,
                  child: Center(
                    child: Text(
                      categoryName[index],
                      style: smallTextStyle,
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

// this method showing Popular Hotels List in the Screen 
  Widget PopularHotelscolumn(width, height, popularHotels, ontap) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      scrollDirection: Axis.vertical,
      itemCount: popularHotels.length,
      itemBuilder: (context, index) => InkWell(
        onTap: ontap,
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
                  popularHotels[index].image,
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
                            Text("${popularHotels[index].rating}", style: whiteSmallTextStyle)
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
