import 'package:abodein/src/view/Booking/booking.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
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
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              height: height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(room.imageUrl),
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(room.facilities.length, (index) {
                      return Column(
                        children: [
                          Icon(room.facilityIcons[index]),
                          SizedBox(height: height * 0.005),
                          Text(room.facilities[index]),
                        ],
                      );
                    }),
                  ),
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
      ),
    );
  }
}

class RoomProvider with ChangeNotifier {
  Room _room = Room(
    name: 'Deluxe Room',
    imageUrl: 'assets/images/The Image of Choose Your Room.png',
    pricePerNight: 320.0,
    facilities: ['Free Wifi', 'Free Parking', 'Mini Bar'],
    facilityIcons: [Icons.wifi, Icons.local_parking_outlined, Icons.local_bar],
    roomFacilities: [
      'Tea/Coffee Maker',
      'Minibar',
      'Safety Deposit Box',
      'Telephone',
      'Air conditioning',
      'Wake Up Service',
      'Balcony',
      'Radio',
      'Desk',
      'Ironing Facilities',
    ],
  );

  Room get room => _room;

  void updateRoom(Room room) {
    _room = room;
    notifyListeners();
  }
}

class Room {
  final String name;
  final String imageUrl;
  final double pricePerNight;
  final List<String> facilities;
  final List<IconData> facilityIcons;
  final List<String> roomFacilities;

  Room({
    required this.name,
    required this.imageUrl,
    required this.pricePerNight,
    required this.facilities,
    required this.facilityIcons,
    required this.roomFacilities,
  });
}
