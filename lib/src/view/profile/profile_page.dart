import 'package:abodein/src/view/common_Widgets/icon.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/profile_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: height * 0.27,
              width: width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Profile_Bg_Image.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                height: height * 0.25,
                width: width,
                color: Color.fromARGB(71, 0, 0, 0),
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1,
                      width: width,
                      color: Color.fromARGB(77, 0, 0, 0),
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
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/reviewrs_person_1.png",
                                ),
                              ),
                              shape: BoxShape.circle,
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
                height: height * 0.31,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 0.2),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1055033030/photo/black-luxury-fabric-background-with-copy-space.jpg?s=612x612&w=0&k=20&c=GioontsvvqDs78UdDVnWk9O6S0oGCFzEbcddjG84rBs="),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DEBIT",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Text("PREMIUM", style: whiteMediumTextStyle),
                            ],
                          ),
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
                      sizedBox(height * 0.02, 0.0),
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
                      sizedBox(height * 0.015, 0.0),
                      Center(
                        child: Text(
                          "0352  9875  7654  3214",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              letterSpacing: 2.6,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "05/25",
                          style: whiteSmallTextStyle,
                        ),
                      ),
                      sizedBox(height * 0.015, 0.0),
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
            sizedBox(height * 0.03, 0.0),
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
      padding: EdgeInsets.symmetric(horizontal: width * 0.045),
      itemCount: 7,
      itemBuilder: (context, index) {
        IconData iconData = Icons.abc;
        String text = "";
        Color iconColor = Colors.black;
        VoidCallback onPressed = () {};
        switch (index) {
          case 0:
            iconData = Icons.edit_outlined;
            text = "Edit Profile";
            iconColor = Colors.yellow;
            onPressed = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashBoard(),
                ),
              );
            };
          case 1:
            iconData = Icons.settings_outlined;
            text = "Account Setting";
            iconColor = Colors.blueAccent;
          case 2:
            iconData = Icons.favorite_border_outlined;
            text = "Favorite";
            iconColor = Colors.pinkAccent;
          case 3:
            iconData = Icons.history;
            text = "Booking History";
            iconColor = Colors.green;
          case 4:
            iconData = Icons.phone_iphone_outlined;
            text = "Smart Cheking";
            iconColor = Colors.purple;
          case 5:
            iconData = Icons.wallet_giftcard_outlined;
            text = "Reward";
            iconColor = Colors.blue;
          case 6:
            iconData = Icons.logout_outlined;
            text = "Logoout";
            iconColor = Colors.red;
          default:
        }
        return Padding(
          padding: EdgeInsets.only(bottom: height * 0.025),
          child: InkWell(
            onTap: onPressed,
            child: Container(
              height: height * 0.07,
              width: width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 40, 40, 40),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: Row(
                  children: [
                    AppIcon(
                      //============================== Icon Data ==========================
                      iconData: iconData,
                      //============================== Icon Color ==========================
                      color: iconColor,
                      height: height * 0.03,
                    ),
                    sizedBox(0.0, width * 0.05),
                    Text(
                      //================================= Text ==============================
                      text,
                      style: whiteSmallTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
