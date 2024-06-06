import 'package:abodein/src/view/dashBoard/top_destination/top_destination.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  final bool backButton;
  const FavoriteScreen({super.key, required this.backButton});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final hotelDetailProvider =
        Provider.of<HotelDetailProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // Silver App Bar For custumization, utilize un Floatable App Bar
          SliverAppBar(
            floating: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text("Favorite", style: mediumTextStyle),
            leading: backButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.black,
                    icon: Icon(
                      Icons.arrow_back_outlined,
                    ),
                  )
                : SizedBox(width: 0),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                sizedBox(height * 0.025, 0.0),
                HotelBoxList(
                  itemCount: hotelDetailProvider.favoriteList.length,
                  scrollDirectionVertical: true,
                  height: height,
                  width: width,
                  name: "Sheraton Grand Hotel",
                  price: 599,
                  city: 'Dubai',
                  image: "assets/images/getstart_image.jpg",
                  rating: 4.8,
                  description: "",
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
