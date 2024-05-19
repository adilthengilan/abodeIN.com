import 'package:abodein/src/view/common_Widgets/icon.dart';

import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_model/profile_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool darktheme = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: darktheme ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: height * 0.27,
              width: width,
              decoration: BoxDecoration(
                image: darktheme
                    ? DecorationImage(
                        image: AssetImage("assets/images/Profile_Bg_Image.png"),
                        fit: BoxFit.fill,
                      )
                    : DecorationImage(
                        image: AssetImage(
                            "assets/images/profile_background_lightTheme.png"),
                        fit: BoxFit.cover,
                      ),
              ),
              child: Container(
                height: height * 0.25,
                width: width,
                color: darktheme
                    ? Color.fromARGB(71, 0, 0, 0)
                    : Color.fromARGB(0, 0, 0, 0),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width,
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.02, left: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: transparantColor,
                              child: IconButton(
                                onPressed: () {},
                                color: Colors.white,
                                icon: Icon(
                                  Icons.arrow_back_outlined,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sizedBox(height * 0.015, 0.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.046),
                      child: Row(
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
                              padding:
                                  EdgeInsets.only(left: width * 0.125, top: 50),
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
                          sizedBox(0.0, width * 0.06),
                          //===================================================================== User Name ===========================================
                          Text("John Smith", style: whiteMediumTextStyle),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            // ====================================================================== The Card of The User =============================================
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Container(
                height: height * 0.28,
                width: width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(-0.3, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 0,
                      color: darktheme
                          ? Color.fromARGB(255, 165, 223, 254)
                          : Color.fromARGB(255, 248, 248, 248),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage("assets/images/Card_Background_image.png"),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.025,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("PREMIUM", style: whiteMediumTextStyle),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ABODEIN",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Text(
                                "INTERNATIONAL",
                                style: whiteLightTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.01),
                        child: Container(
                          height: height * 0.045,
                          child: Image(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/Debit_Card_Chip.png"),
                          ),
                        ),
                      ),
                      sizedBox(height * 0.002, 0.0),
                      Text(
                        "JOHN SMITH",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: 2.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //======================================================================== Buttons List ===================================================
            profileButtonsList(height, width),
          ],
        ),
      ),
    );
  }

  // The Profile Buttons Listing in the ListView Builder, it Has 7 buttons, and its Title, Icon, and Icon color it is in a Map List Button Components
  Widget profileButtonsList(height, width) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: (context, index) {
        IconData iconData = Icons.circle;
        String text = "";
        Color iconColor = Colors.transparent;
        VoidCallback onPressed = () {};
        switch (index) {
          case 0:
            iconData = Icons.edit_outlined;
            text = "Edit Profile";
            iconColor = Colors.yellow;
            onPressed = () {
              setState(() {
                darktheme = !darktheme;
              });
            };
          case 1:
            iconData = Icons.settings_outlined;
            text = "Account Setting";
            iconColor = Colors.blueAccent;
            onPressed = () {};
          case 2:
            iconData = Icons.favorite_border_outlined;
            text = "Favorite";
            iconColor = Colors.pinkAccent;
            onPressed = () {};
          case 3:
            iconData = Icons.history;
            text = "Booking History";
            iconColor = Colors.green;
            onPressed = () {};
          case 4:
            iconData = Icons.phone_iphone_outlined;
            text = "Smart Cheking";
            iconColor = Colors.purple;
            onPressed = () {};
          case 5:
            iconData = Icons.wallet_giftcard_outlined;
            text = "Reward";
            iconColor = Colors.blue;
            onPressed = () {};

          case 6:
            iconData = Icons.logout_outlined;
            text = "Logoout";
            iconColor = Colors.red;
            onPressed = () {};
          default:
        }
        return Column(
          children: [
            Divider(
              thickness: 0.1,
              color: darktheme ? Colors.white : Colors.black,
            ),
            InkWell(
              onTap: onPressed,
              child: SizedBox(
                height: height * 0.07,
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    children: [
                      AppIcon(
                        //============================== Icon Data ==========================
                        iconData: iconData,
                        //============================== Icon Color ==========================
                        color: iconColor,
                        height: height * 0.03,
                      ),
                      sizedBox(0.0, width * 0.08),
                      Text(
                        //================================= Text ==============================
                        text,
                        style: darktheme
                            ? whiteSmallTextStyle
                            : smallTextStyleblack,
                      ),
                      Spacer(),
                      // ===================================== Arrow Iocn ==========================
                      AppIcon(
                        iconData: Icons.arrow_forward_ios_rounded,
                        color: darktheme ? Colors.white : greyShadeMedium,
                        height: height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
