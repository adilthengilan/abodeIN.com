import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/hotel_details.dart/hotel_details_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
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
        // ---------------------------------------------------------------------- Costom App bar For silver App Bar
        slivers: <Widget>[
          SliverAppBar(
            //------------------------------------------------------------------ Pinned App Bar ( Silver App Bar For Floating False)
            surfaceTintColor: backgroundColor,
            backgroundColor: backgroundColor,
            leadingWidth: width * 0.54,
            leading: Padding(
              padding: EdgeInsets.only(left: width * 0.04, top: 5),
              child: Text("Discover", style: largeTextStyle),
            ),
            actions: [
              CircleAvatar(
                radius: height * 0.03,
                backgroundColor: shadeColor,
                child: Center(
                  child: AppIcon(
                    iconData: Icons.search_outlined,
                    color: greyShadeDark,
                    height: height * 0.03,
                  ),
                ),
              ),
              sizedBox(0.0, width * 0.025),
              CircleAvatar(
                radius: height * 0.03,
                backgroundColor: shadeColor,
                child: Center(
                  child: AppIcon(
                    iconData: Icons.notifications_outlined,
                    color: greyShadeDark,
                    height: height * 0.03,
                  ),
                ),
              ),
              sizedBox(0.0, width * 0.04),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                sizedBox(height * 0.03, 0.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    child: Row(
                      children: [
                        Wrap(
                          spacing: width * 0.025,
                          children: List.generate(
                            dashboardProvider.categories.length,
                            (index) => Consumer<DashBoardProvider>(
                              builder: (context, value, child) => InkWell(
                                onTap: () {
                                  value.setCategoryButtonColor(index);
                                },
                                child: Container(
                                  height: height * 0.063,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05,
                                  ),
                                  decoration: BoxDecoration(
                                    color: value.selectedCategoryIndex == index
                                        ? primarycolor
                                        : shadeColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dashboardProvider.categories[index],
                                      style:
                                          value.selectedCategoryIndex == index
                                              ? whiteSmallTextStyle
                                              : smallTextStyle,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.03, 0.0),
                SizedBox(
                  height: height * 0.29,
                  width: width,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Container(
                          width: width * 0.6,
                          height: height,
                          margin: EdgeInsets.only(right: width * 0.04),
                          decoration: BoxDecoration(
                            color: shadeColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "assets/images/suggetion_hotel_image_2.png"),
                          ),
                        ),
                        // ============================================================================================================
                        //======================================================= Rating Icon & Text ===========================================
                        Positioned(
                          top: height * 0.015,
                          left: width * 0.02,
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
                                        iconData: Icons.star_border_outlined,
                                        color: backgroundColor,
                                        height: height * 0.022,
                                      ),
                                    ),
                                  ),
                                  sizedBox(0.0, width * 0.0035),
                                  Text("4.8", style: whiteSmallTextStyle)
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ============================================================================================================
                        //================================================== 3D View ======================================================
                        Positioned(
                          top: height * 0.015,
                          right: width * 0.06,
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
                                  Text("3D View", style: whiteSmallTextStyle)
                                ],
                              ),
                            ),
                          ),
                        ),
                        // ============================================================================================================
                        //================================================== Price $ Booking Person Count ======================================================
                        Positioned(
                          bottom: height * 0.015,
                          left: width * 0.04,
                          right: width * 0.075,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bankok", style: whiteSmallTextStyle),
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
                        ),
                      ],
                    ),
                  ),
                ),
                sizedBox(height * 0.025, 0.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Text("Top Destination", style: largeTextStyle),
                ),
                sizedBox(height * 0.015, 0.0),
                //=======================================================================================================================================
                ListView.builder(
                  itemCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Container(
                        height: height * 0.265,
                        width: width,
                        margin: EdgeInsets.only(bottom: height * 0.02),
                        decoration: BoxDecoration(
                          color: shadeColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/popular_hotel_image_3.png"),
                        ),
                      ),
                      // ============================================================================================================
                      //================================================== 3D View ======================================================
                      Positioned(
                        top: height * 0.015,
                        right: width * 0.03,
                        child: Container(
                          height: height * 0.0505,
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
                                Text("3D View", style: whiteSmallTextStyle)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ============================================================================================================
                      //======================================================= Rating Icon & Text ===========================================
                      Positioned(
                        top: height * 0.015,
                        right: width * 0.35,
                        child: Container(
                          height: height * 0.0505,
                          padding: EdgeInsets.only(right: width * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: transparantColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.005),
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
                                Text("4.8", style: whiteSmallTextStyle)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ============================================================================================================
                      //======================================================= Map & Map View ===========================================
                      Positioned(
                        top: height * 0.015,
                        left: width * 0.03,
                        child: Container(
                          height: height * 0.0505,
                          padding: EdgeInsets.only(right: width * 0.02),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: transparantColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(height * 0.005),
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
                                Text("Map", style: whiteSmallTextStyle)
                              ],
                            ),
                          ),
                        ),
                      ),
                      // ============================================================================================================
                      //================================================== Price $ Booking Person Count ======================================================
                      Positioned(
                        bottom: height * 0.04,
                        left: width * 0.04,
                        right: width * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bankok", style: whiteSmallTextStyle),
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

// This Method is To Display "See all" Button in the DashBoard Every where
  Widget headingAndSeeAllButton(width, text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: mediumTextStyleLight),
          Text(
            // ------------------- See All Button
            "See all",
            style: smallTextStyle,
          ),
        ],
      ),
    );
  }

  Widget SuggestionsForYouRow(width, height, suggestionsHotel) {
    return Container(
      color: backgroundColor,
      width: width,
      height: height * 0.35,
      //---------------------------------------------------- List View Builder
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.008,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: suggestionsHotel.length,
        itemBuilder: (context, index) => Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //---------Navigating to Hotel Detaile Page [Hotel Image, Hotel Name, Location, Price, Rating]
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
                width: width * 0.60,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-0.5, 1),
                      color: greyShadeLight,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.013,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.23,
                        width: width,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            // ----------------------------------- Hotel Image
                            suggestionsHotel[index].image[0],
                          ),
                        ),
                      ),
                      sizedBox(height * 0.015, 0.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            //------------------------------------------- Hotel Name
                            "Lux Hotel",
                            style: mediumTextStyleSemiBold,
                          ),
                          Row(
                            children: [
                              //------------------------------------ Rating Star Icon
                              AppIcon(
                                iconData: Icons.star,
                                color: orangeColor,
                                height: height,
                              ),
                              sizedBox(0.0, width * 0.01),
                              Text(
                                // ------------------------------------------- Hotel Rating
                                "${suggestionsHotel[index].rating}",
                                style: smallTextStyle,
                              ),
                              sizedBox(0.0, width * 0.01),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // -------------------------------------- Location Icon
                              AppIcon(
                                iconData: Icons.location_on,
                                color: greyShadeMedium,
                                height: height,
                              ),
                              sizedBox(0.0, width * 0.01),
                              Text(
                                // -------------------------------------------- Hotel Location
                                suggestionsHotel[index].location,
                                style: smallTextStyle,
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              //----------------------------------------------------- Hotel Price
                              text: "${suggestionsHotel[index].price}",
                              style: smallTextStyleSemiBold,
                              children: [
                                TextSpan(text: "/Night", style: smallTextStyle),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
      height: height * 0.07,
      child: ListView.builder(
        // -----------------------------------------ListView Builder
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.06,
          vertical: height * 0.004,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: ontap,
          child: Container(
            //----------------------------------------------------- Category Box
            height: height * 0.04,
            width: width * 0.33,
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(-1, 1),
                  color: greyShadeLight,
                  blurRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.015,
                      top: height * 0.006,
                      right: width * 0.01),
                  child: Image(
                    //------------------------------------------------------ Category Image
                    image: AssetImage(
                      categoryList[index]["image"],
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.16,
                  height: height * 0.053,
                  child: Center(
                    child: Text(
                      // ---------------------------------------------------- Category Name
                      categoryList[index]["Name"],
                      style: smallTextStyleSemiBold,
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
  Widget PopularHotelscolumn(width, height, popularHotels) {
    return GridView.builder(
      //----------------------------------Grid View Builder
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: width * 0.06,
        right: width * 0.06,
        bottom: height * 0.04,
      ),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Set the number of columns in the grid
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 6.5 / 10,
      ),
      itemCount: 3,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              //----------------------------------------- Navigating to Hotel Detaile Page with [Image, Name, Location, Price, Rating] By parameter
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
          //------------------------------------------ Container
          padding: EdgeInsets.only(
              right: width * 0.025,
              left: width * 0.025,
              top: height * 0.01,
              bottom: height * 0.015),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              //-------------------------------------------- Box Shadow
              BoxShadow(
                offset: Offset(0, 2),
                color: greyShadeLight,
                blurRadius: 2,
              )
            ],
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.14,
                child: Image(
                  image: AssetImage(
                    //-------------------------------------------------- Popular Hotel Images
                    popularHotels[index].image[0],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              sizedBox(height * 0.01, 0.0),
              //----------------------------------------------------------------- Popular Hotel Name
              Text(popularHotels[index].name, style: mediumTextStyleSemiBold),
              Row(
                children: [
                  AppIcon(
                    iconData: Icons.location_on,
                    color: greyShadeMedium,
                    height: height,
                  ),
                  sizedBox(0.0, width * 0.01),
                  Text(
                    popularHotels[index]
                        .location, // ---------------------------------- Location Icon
                    style: smallTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  AppIcon(
                    // ---------------------------------------- Rating Star Icon
                    iconData: Icons.star,
                    color: orangeColor,
                    height: height,
                  ),
                  sizedBox(0.0, width * 0.01),
                  Text(
                    // ------------------------------------------------Hotel Rating
                    "${popularHotels[index].rating}",
                    style: smallTextStyle,
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  // ----------------------------------------------------- Hotel Price
                  text: "${popularHotels[index].price}",
                  style: smallTextStyleSemiBold,
                  children: [
                    TextSpan(text: "/Night", style: smallTextStyle),
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
