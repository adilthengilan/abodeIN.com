import 'package:abodein/src/view/Booking/booking.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/hotel_rooms_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomsDetailsScreen extends StatelessWidget {
  const RoomsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class RoomDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final roomProvider = Provider.of<RoomProvider>(context);
    final room = roomProvider.room;
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;

    return Scaffold(
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  AppBar  >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: backgroundColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.favorite_border_outlined,
        //       color: Colors.red,
        //     ),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
        backgroundColor: Colors.transparent,
      ),
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  Here details image of rooms and other ankle images lists>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

            Container(
              width: width,
              height: height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(room.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.38),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) {
                        return Container(
                          height: height * 0.10,
                          width: width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/rooms_selection.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(color: backgroundColor)),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//////////////////////////////  Room price,type,etc and amenities list
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    room.name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizedBox(height * 0.01, width),
                  Text('\$${room.pricePerNight} /per night',
                      style: greyTextstyle),
                  sizedBox(height * 0.02, width),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(room.facilities.length, (index) {
                        return Column(
                          children: [
                            Container(
                              height: height * 0.06,
                              width: width * 0.17,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: room.color[index],
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(-0.3, 1),
                                      blurRadius: 2,
                                      blurStyle: BlurStyle.normal,
                                      spreadRadius: 0,
                                      color: greyShadeDark
                                      // color: darktheme
                                      //     ? Color.fromARGB(255, 165, 223, 254)
                                      //     : Color.fromARGB(255, 248, 248, 248),
                                      ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  room.facilityIcons[index],
                                  color: backgroundColor,
                                  size: 30,
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.24,
                              child: Text(
                                room.facilities[index],
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  ),
                  //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  //room facilities description/ bullet points of facilities
                  sizedBox(height * 0.02, width),
                  Text('Room facilities:', style: smallTextStyleSemiBold),
                  sizedBox(height * 0.01, width),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: room.roomFacilities.map((facility) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text('• $facility'),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Book now>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: width * 0.03,
          right: width * 0.03,
          bottom: height * 0.02,
        ),
        child: Container(
          child: AppTextButton(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 255, 170, 96),
                Color.fromARGB(255, 226, 109, 13),
              ]),
              text: 'Book Now',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Booking()));
              },
              height: height,
              width: width),
        ),
      ), //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    );
  }
}

class Room {
  final String name;
  final String imageUrl;
  final double pricePerNight;
  final List<String> facilities;
  final List<IconData> facilityIcons;
  final List<String> roomFacilities;
  final List<Color> color;

  Room({
    required this.name,
    required this.imageUrl,
    required this.pricePerNight,
    required this.facilities,
    required this.facilityIcons,
    required this.roomFacilities,
    required this.color,
  });
}
