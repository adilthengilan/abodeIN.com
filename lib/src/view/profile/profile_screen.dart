import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/profile/booking_history/booking_history.dart';
import 'package:abodein/src/view/favorite_screen/favorite_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/room_controling/room_controller_screen.dart';
import 'package:abodein/src/view_Model/profile_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: width,
              padding: EdgeInsets.only(
                top: height * 0.12,
                bottom: height * 0.06,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 228, 228, 228),
                  ),
                  BoxShadow(
                    offset: Offset(-3, 0),
                    blurRadius: 4,
                    color: Color.fromARGB(255, 216, 216, 216),
                  ),
                ],
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 163, 238, 255),
                  Color.fromARGB(255, 252, 215, 249),
                ]),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.046),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.11,
                      width: width * 0.22,
                      decoration: BoxDecoration(
                        color: transparantColor,
                        shape: BoxShape.circle,
                        image: profileProvider.image != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(profileProvider.image!),
                              )
                            : DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/Profile_person_Icon.png",
                                ),
                              ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.125, top: 50),
                        //================================================================ Image Picker Button ==================================================
                        child: MaterialButton(
                          onPressed: () {
                            // =========================================================== Image Picker From Device Gallery [Function] ===========================
                            profileProvider.openImagePicker();
                          },
                          color: Colors.blue,
                          child: Center(
                            child: AppIcon(
                              iconData: Icons.photo_camera,
                              color: Colors.white,
                              height: height * 0.02,
                            ),
                          ),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(2),
                        ),
                      ),
                    ),
                    sizedBox(height * 0.03, 0.0),
                    //===================================================================== User Name ===========================================
                    Container(
                      padding: EdgeInsets.only(left: width * 0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("John Smith", style: mediumTextStyleLight),
                          sizedBox(0.0, width * 0.015),
                          Provider.of<ProfileProvider>(context, listen: false)
                                      .blueTickVerification
                              ? Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                    Text("+971 52 345 6789", style: smallTextStyle),
                    sizedBox(height * 0.061, 0.0),
                    Container(
                      height: height * 0.11,
                      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
                      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(4, 4),
                            blurRadius: 4,
                            color: Color.fromARGB(45, 158, 158, 158),
                          ),
                          BoxShadow(
                            offset: Offset(-2, 0),
                            blurRadius: 4,
                            color: Color.fromARGB(255, 216, 216, 216),
                          ),
                        ],
                      ),
                      // child: ===================================== Child ,
                    ),
                    sizedBox(height * 0.02, width),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2,
                          (index) {
                            String text = '';
                            IconData icon = Icons.circle;
                            VoidCallback onTap = () {};
                            switch (index) {
                              case 0:
                                text = 'Profile';
                                icon = Icons.edit_outlined;
                                onTap = () {};
                              case 1:
                                text = 'Account';
                                icon = Icons.settings_outlined;
                                onTap = () {
                                };
                                break;
                              default:
                            }
                            return InkWell(
                              onTap: onTap,
                              child: Container(
                                height: height * 0.085,
                                width: width * 0.39,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(4, 4),
                                      blurRadius: 4,
                                      color: Color.fromARGB(44, 198, 198, 198),
                                    ),
                                    BoxShadow(
                                      offset: Offset(-2, 0),
                                      blurRadius: 4,
                                      color: Color.fromARGB(255, 216, 216, 216),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(text, style: smallTextStyle),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      child: Material(
                                        shape: CircleBorder(),
                                        color: Colors.white,
                                        elevation: 1,
                                        shadowColor: Colors.white70,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Icon(
                                            icon,
                                            size: height * 0.023,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            //======================================================================== Buttons List ===================================================
            _buildProfileButtonsGridType(height, width),
            sizedBox(height * 0.04, 0.0),
            Container(
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: height * 0.015),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(4, 6),
                    blurRadius: 8,
                    color: Color.fromARGB(44, 198, 198, 198),
                  ),
                  BoxShadow(
                    offset: Offset(-2, 0),
                    blurRadius: 8,
                    color: Color.fromARGB(255, 216, 216, 216),
                  ),
                ],
              ),
              child: Column(
                children: List.generate(
                  3,
                  (index) {
                    String text = '';
                    IconData icon = Icons.circle;
                    Color iconColor = Colors.transparent;
                    switch (index) {
                      case 0:
                        text = 'Help';
                        icon = Icons.help_outline_outlined;
                        iconColor = Colors.blue;
                      case 1:
                        text = 'About';
                        icon = Icons.info_outlined;
                        iconColor = Colors.purple;
                      case 2:
                        text = 'Log out';
                        icon = Icons.logout_rounded;
                        iconColor = Colors.red;
                        break;
                      default:
                    }
                    return Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: Row(
                            children: [
                              Icon(
                                icon,
                                color: iconColor,
                              ),
                              sizedBox(0.0, width * 0.04),
                              Text(text, style: smallTextStyle),
                              Spacer(),
                              Icon(Icons.chevron_right)
                            ],
                          ),
                        ),
                        index != 2
                            ? Padding(
                                padding: EdgeInsets.only(left: width * 0.08),
                                child: Divider(),
                              )
                            : SizedBox()
                      ],
                    );
                  },
                ),
              ),
            ),
            sizedBox(height * 0.15, 0.0),
          ],
        ),
      ),
    );
  }

  // The Profile Buttons Listing in the ListView Builder, it Has 7 buttons, and its Title, Icon, and Icon color it is in a Map List Button Components
  Widget _buildProfileButtonsGridType(height, width) {
    return GridView.builder(
      itemCount: 4,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        IconData iconData = Icons.circle;
        String text = "";
        Color iconColor = Colors.transparent;
        VoidCallback onPressed = () {};
        int selectedindex = 0;
        switch (index) {
          case 0:
            iconData = Icons.favorite_border_outlined;
            text = "Favorite";
            iconColor = Colors.pinkAccent;
            onPressed = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(backButton: true),
                ),
              );
            };
          case 1:
            iconData = Icons.history;
            text = "Booking";
            iconColor = Colors.green;
            onPressed = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BookingHistory()));
            };
          case 2:
            iconData = Icons.phone_iphone_outlined;
            text = "Smart Cheking";
            iconColor = Colors.purple;
            onPressed = () {
              selectedindex == index;
            };
          case 3:
            iconData = Icons.wallet_giftcard_outlined;
            text = "Reward";
            iconColor = Colors.blue;
            onPressed = () {};

          default:
        }
        return Container(
          height: height * 0.035,
          padding: EdgeInsets.all(height * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 1),
                blurRadius: 2,
                color: Color.fromARGB(222, 228, 228, 228),
              ),
              BoxShadow(
                offset: Offset(-2, 0),
                blurRadius: 2,
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.045,
                ),
                AppIcon(
                  //============================== Icon Data ==========================
                  iconData: iconData,
                  //============================== Icon Color ==========================
                  color: iconColor,
                  height: height * 0.06,
                ),
                Spacer(),
                Text(
                  //================================= Text ==============================
                  text,
                  style: isDarkMode ? whiteSmallTextStyle : smallTextStyle,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
