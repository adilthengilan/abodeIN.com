import 'package:abodein/src/view/dashBoard/top_destination/top_destination.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({super.key});

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
            backgroundColor: Colors.transparent,
            title: Text("Booking History", style: mediumTextStyle),
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
                sizedBox(height * 0.03, 0.0),
                HotelBoxList(
                  itemCount: 12,
                  scrollDirectionVertical: true,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  image: "assets/images/getstart_image.jpg",
                  rating: 4.8,
                  description: "",
                  city: 'Dubai',
                  location: "Dubai Palace",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
