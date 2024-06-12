import 'package:abodein/src/view/About%20us/about_us.dart';
import 'package:abodein/src/view/About%20us/help_support.dart';
import 'package:abodein/src/view/About%20us/privacy_policy.dart';
import 'package:abodein/src/view/profile/booking_history.dart';
import 'package:abodein/src/view/profile/favorite_screen.dart';
import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/rewards%20screen/reward_screen.dart';
import 'package:abodein/src/view_Model/theme_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: backgroundColor,
      width: width * 0.84,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: ListView(
          children: [
            //=============== Profile =======================
            sizedBox(height * 0.050, width),
            _buildHeader(height, width),
            //================= Home =================
            sizedBox(height * 0.040, width),
            // Divider(),
            _buildItem(
                icon: CupertinoIcons.house_alt,
                color: Colors.pink,
                title: " Home",
                index: 0,
                onTap: () {
                  Navigator.pop(context);
                }),

            //====================== Profile ===========================
            _buildItem(
                icon: CupertinoIcons.person_fill,
                color: const Color.fromARGB(255, 12, 137, 137),
                title: " Profile",
                index: 1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
            //==================Notification ===================
            _buildItem(
                icon: CupertinoIcons.collections,
                color: Colors.orange,
                title: " History",
                index: 2,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingHistory()));
                }),
            //=============================== Discover ==========================
            _buildItem(
                icon: CupertinoIcons.gift_alt,
                color: Color.fromARGB(255, 151, 197, 42),
                title: " Rewards",
                index: 3,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RewardScreen()));
                }),
            //=========================Collections ==============================
            _buildItem(
                icon: Icons.favorite_outline,
                color: Colors.red,
                title: " Favourites",
                index: 4,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FavoriteScreen()));
                }),
            //=============================== Share =============================
            _buildItem(
                icon: Icons.share,
                color: Color.fromARGB(255, 237, 39, 221),
                title: " Share",
                index: 4,
                onTap: () {
                  Share.share("com.example.abodein");
                }),
            //========================== About ==============================
            _buildItem(
                icon: CupertinoIcons.exclamationmark_circle,
                color: Color.fromARGB(255, 60, 107, 248),
                title: " About",
                index: 4,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                }),
//====================================================== color scheme dark or light mode ==========================================================================
            sizedBox(height * 0.04, width),
            ListTile(
              leading: Icon(Icons.change_circle_outlined),

              // color: selectedDrawerIndex == index
              //     ? Color.fromARGB(255, 161, 135, 255)
              //     : Colors.white),
              title: Text(
                'Color Scheme',
                // style: TextStyle(
                //     color:
                //      selectedDrawerIndex == index
                //         ? Color.fromARGB(255, 161, 135, 255)
                //         : Colors.white

                //         ),
              ),
              minLeadingWidth: 5,
            ),

            Padding(
              padding: EdgeInsets.only(
                right: width * 0.10,
              ),
              child: ThemeToggleWidget(),
            )
//=============================================================================================================================================================================
            // sizedBox(height * 0.08, width),
            // accounts(),
            // Row(
            //   children: [
            //     //=============================Settings=============================
            //     _buildItem(
            //         icon: CupertinoIcons.settings,
            //         title: " Settings",
            //         index: 5,
            //         onTap: () {
            //           _navigateToScreen(context, 5);
            //         }),
            //     //======================== Logout =============================
            //     _buildItem(
            //         icon: Icons.logout_sharp,
            //         title: " Logout",
            //         index: 6,
            //         onTap: () {
            //           _navigateToScreen(context, 6);
            //         }),
            //   ],
            // )

            // sizedBox(height * 0.09, width),
          ],
        ),
      ),
    );
  }

  // ===================================== Header (Profile pic and name)==========================================
  Widget _buildHeader(height, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/person_dp.png'),
              radius: 50,
            ),
            sizedBox(height * 0.02, width * 0.01),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" Robert Browney", style: smallboldTextStyle),
                Text(" roberty@gmail.com", style: smallTextStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }

  //=================================== Build Items ===================================
  Widget _buildItem(
      {required IconData icon,
      required String title,
      required int index,
      required GestureTapCallback onTap,
      required Color color}) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      iconColor: color,
      // color: selectedDrawerIndex == index
      //     ? Color.fromARGB(255, 161, 135, 255)
      //     : Colors.white),
      title: Text(
        title,
        // style: TextStyle(
        //     color:
        //      selectedDrawerIndex == index
        //         ? Color.fromARGB(255, 161, 135, 255)
        //         : Colors.white

        //         ),
      ),
      onTap: onTap,
      minLeadingWidth: 5,
    );
  }

  // Widget accounts() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //           height: 60,
  //           width: 60,
  //           child: Image(
  //               image:
  //                   AssetImage('assets/images/facebk-removebg-preview.png'))),
  //       Container(
  //           height: 60,
  //           width: 60,
  //           child: Image(
  //               image: AssetImage('assets/images/xtw-removebg-preview.png'))),
  //       Container(
  //           height: 50,
  //           width: 50,
  //           child: Image(
  //               image: AssetImage('assets/images/insta-removebg-preview.png'))),
  //     ],
  //   );
  // }
}

class ThemeToggleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.isDarkMode;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOption(
            context,
            icon: Icons.wb_sunny,
            label: 'Light',
            isSelected: !isDarkMode,
            onTap: () {
              if (isDarkMode) themeProvider.toggleTheme();
            },
          ),
          _buildOption(
            context,
            icon: Icons.nights_stay,
            label: 'Dark',
            isSelected: isDarkMode,
            onTap: () {
              if (!isDarkMode) {
                themeProvider.toggleTheme();
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 142, 104, 208)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
