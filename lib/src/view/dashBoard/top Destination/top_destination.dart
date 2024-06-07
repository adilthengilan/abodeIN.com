import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/details/hotel_details_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopDestination extends StatelessWidget {
  const TopDestination({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                  itemCount: 10,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: "assets/images/getstart_image.jpg",
                  rating: 4.8,
                  description: "",
                  location: "Dubai",
                  city: 'Ajman', scrollDirectionVertical: true,
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
  final String image;
  final double rating;
  final String location;
  final String city;
  final String description;
  final int itemCount;
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
    required this.city, required bool scrollDirectionVertical,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.42,
      width: width,
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.02,
        ),
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            right: width * 0.04,
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
                    color: Color.fromARGB(47, 80, 79, 79),
                  ),
                  BoxShadow(
                    offset: Offset(-4, -1),
                    blurRadius: 8,
                    color: Color.fromARGB(255, 216, 216, 216),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 227, 227),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/zfri2szh.png')),
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
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.61,
                              child: Text(
                                "Hotel Niagara Popo",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.3,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            sizedBox(height * 0.007, 0.0),
                            Text(
                              'New York, USA',
                              style: smallTextStyle,
                            ),
                            sizedBox(height * 0.015, 0.0),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            sizedBox(height * 0.01, 0.0),
                            Text(
                              '\$1,599',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: width * 0.046,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text("1 night"),
                          ],
                        ),
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