import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/dashBoard/hotel_details_screen/hotel_details_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      itemBuilder: (context, index) => Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.025),
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelDetailePage(),
                  ),
                );
              },
              child: Container(
                height: height * 0.3,
                width: width,
                decoration: BoxDecoration(
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
    );
  }
}
