import 'package:abodein/src/view/common_Widgets/profile_menu_widget.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox(height * 0.03, width),
            //<<<<<<<<<<<<<<<<<<<<<<<<AppBar>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ],
            ),
            sizedBox(height * 0.07, width),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(
                          image: AssetImage("assets/images/profile demo.png")),
                    ),
                  ),
                ),
              ],
            ),
            sizedBox(height * 0.02, width),
            Text(
              "Jhon Smith",
              style: mediumTextStyleLight,
            ),
            sizedBox(height * 0.07, width),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileMenuWidget(
                    title: 'Edit Profile',
                    icon: Icons.edit_outlined,
                    onpressed: () {}),
                sizedBox(height * 0.01, width),
                ProfileMenuWidget(
                    title: 'Account Settings',
                    icon: Icons.settings,
                    onpressed: () {}),
                sizedBox(height * 0.01, width),
                ProfileMenuWidget(
                    title: 'Favourites',
                    icon: Icons.favorite_outline,
                    onpressed: () {}),
                sizedBox(height * 0.01, width),
                ProfileMenuWidget(
                    title: 'Booking History',
                    icon: Icons.history,
                    onpressed: () {}),
                sizedBox(height * 0.01, width),
                ProfileMenuWidget(
                    title: 'Logout', icon: Icons.logout, onpressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}
