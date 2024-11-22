import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_model/bools_provider.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TopDestination extends StatelessWidget {
  const TopDestination({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bools = Provider.of<boolsProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SliverAppBar(
            floating: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text("Top Destination", style: mediumTextStyle),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black,
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                sizedBox(height * 0.025, 0.0),
                HotelBoxList(
                  scrollDirectionVertical: false,
                  itemCount: Imagess.length,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: Imagess,
                  rating: 4.8,
                  description: "",
                  location: "Dubai",
                  city: 'Ajman',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HotelBoxList extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final int price;
  final List image;
  final double rating;
  final String location;
  final String city;
  final String description;
  final int itemCount;
  final bool scrollDirectionVertical;
  const HotelBoxList({
    super.key,
    required this.height,
    required this.width,
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
    required this.location,
    required this.itemCount,
    required this.city,
    required this.scrollDirectionVertical,
  });

  @override
  Widget build(BuildContext context) {
    final bools = Provider.of<boolsProvider>(context);

    return SizedBox(
      height: height * 0.45,
      width: width,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection:
            scrollDirectionVertical ? Axis.vertical : Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            bottom: scrollDirectionVertical ? width * 0.04 : 0,
            right: scrollDirectionVertical ? 0 : width * 0.04,
          ),
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
              width: width * 0.878,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 10),
                    blurRadius: 8,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  BoxShadow(
                    offset: Offset(-4, -1),
                    blurRadius: 8,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(image[index])),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(height * 0.02),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MapViewButton(height: height, width: width),
                          sizedBox(0.0, width * 0.025),
                          RatingBoxTransparant(
                            height: height,
                            width: width,
                            rating: rating,
                          ),
                          ThreeDView(
                            onTap: () {},
                            height: height,
                            width: width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  sizedBox(height * 0.025, 0.0),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   width: width * 0.61,
                            //   child: Text(
                            //     "Hotel Niagara Popo",
                            //     style: GoogleFonts.poppins(
                            //       textStyle: TextStyle(
                            //         fontSize: width * 0.05,
                            //         fontWeight: FontWeight.w700,
                            //         letterSpacing: -0.3,
                            //         color: Colors.black,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // sizedBox(height * 0.007, 0.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Row(
                                      //   children: List.generate(
                                      //     5,
                                      //     (index) => ratingStarIcon(height),
                                      //   ),
                                      // ),
                                      SizedBox(
                                        width: width * 0.33,
                                        child: Text(
                                          'Baithan',
                                          style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        'Dubai',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12),
                                      ),
                                      // Text(
                                      //   'Cashback: \$${120}',
                                      //   style: GoogleFonts.montserrat(
                                      //       fontSize: 12),
                                      // ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: width * 0.03),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      sizedBox(height * 0.01, 0.0),
                                      Text(
                                        '\AED-${1999}',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Including taxes and fees',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12),
                                      ),
                                      Text(
                                        'For 1 Night',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.02, right: width * 0.02),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.payment,
                                    size: 14,
                                  ),
                                  Text(
                                    'Pay Now',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     sizedBox(height * 0.01, 0.0),
                        //     Text(
                        //       '\$1,599',
                        //       style: GoogleFonts.poppins(
                        //         textStyle: TextStyle(
                        //           fontSize: width * 0.046,
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.w700,
                        //         ),
                        //       ),
                        //     ),
                        //     Text("1 night"),
                        //   ],
                        // ),
                      ],
                    ),
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

Widget ratingStarIcon(height) {
  return Icon(
    Icons.star,
    color: Colors.orange,
    size: height * 0.02,
  );
}
