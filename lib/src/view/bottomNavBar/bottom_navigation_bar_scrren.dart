import 'package:abodein/src/view/Favourites/favourites.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int mycurrentIndex = 0;

  List Pages = const [
    DashBoard(),
    Favorites(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 50,
              offset: Offset(8, 10)),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
              backgroundColor: backgroundColor,
              selectedItemColor: primarycolor,
              currentIndex: mycurrentIndex,
              unselectedItemColor: greyShadeLight,
              onTap: (index) {
                setState(() {
                  mycurrentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite_border_outlined,
                    ),
                    label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.emoji_events_outlined,
                    ),
                    label: 'Notifications'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline,
                    ),
                    label: 'Profile'),
              ]),
        ),
      ),
      body: Pages[mycurrentIndex],
    );
  }
}
