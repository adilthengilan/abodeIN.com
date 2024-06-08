import 'package:abodein/src/view/profile/profile_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/reward/reward_screen.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Color.fromARGB(187, 0, 0, 0),
      width: width * 0.84,
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: ListView(
          children: [
            //=============== Profile =======================
            SizedBox(height: height * 0.050),
            _buildHeader(height, width),
            //================= Home =================
            SizedBox(height: height * 0.060),

            _buildItem(
                icon: CupertinoIcons.house_alt,
                title: " Home",
                index: 0,
                onTap: () {
                  Navigator.pop(context);
                  // _navigateToScreen(context, 0);
                }),

            //====================== Profile ===========================
            _buildItem(
                icon: CupertinoIcons.person_fill,
                title: " Profile",
                index: 1,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                  // _navigateToScreen(context, 1);
                }),
            //==================Notification ===================
            _buildItem(
                icon: CupertinoIcons.collections,
                title: " History",
                index: 2,
                onTap: () {
                  // _navigateToScreen(context, 2);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => BookingHistory()));
                }),
            //=============================== Discover ==========================
            _buildItem(
                icon: CupertinoIcons.gift_alt,
                title: " Rewards",
                index: 3,
                onTap: () {
                  // _navigateToScreen(context, 3);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RewardScreen()));
                }),
            //=========================Collections ==============================
            _buildItem(
                icon: Icons.favorite_outline,
                title: " Favourites",
                index: 4,
                onTap: () {
                  // _navigateToScreen(context, 4);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => FavoriteScreen()));
                }),
            //=============================== Share =============================
            _buildItem(
                icon: Icons.share,
                title: " Share",
                index: 4,
                onTap: () {
                  // _navigateToScreen(context, 4);
                }),
            //========================== About ==============================
            _buildItem(
                icon: CupertinoIcons.exclamationmark_circle,
                title: " About",
                index: 4,
                onTap: () {
                  // _navigateToScreen(context, 4);
                }),

            sizedBox(height * 0.03, width),
            // Divider(),
            // sizedBox(height * 0.08, width),
            accounts(),
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

  // void _navigateToScreen(BuildContext context, int index) {
  //   context.read<DrawerIndexProvider>().updateIndex(index);
  // }

  // ===================================== Header (Profile pic and name)==========================================
  Widget _buildHeader(double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/person_dp.png'),
              radius: 50,
            ),
            SizedBox(
              height: height * 0.02,
              width: width * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(" Robert Browney", style: whiteSmallTextStyle),
                Text(" roberty@gmail.com", style: whiteSmallTextStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }

  //=================================== Build Items ===================================
  Widget _buildItem({
    required IconData icon,
    required String title,
    required int index,
    required GestureTapCallback onTap,
  }) {
    // final selectedDrawerIndex =
    //     context.watch<DrawerIndexProvider>().selectedIndex;

    return ListTile(
      leading: Icon(icon, color: Colors.white),
      // color: selectedDrawerIndex == index
      //     ? Color.fromARGB(255, 161, 135, 255)
      //     : Colors.white),
      title: Text(
        title, style: whiteLightTextStyle,
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

  Widget accounts() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 50,
            width: 50,
            child: Image(
                image:
                    AssetImage('assets/images/facebk-removebg-preview.png'))),
        Container(
            height: 50,
            width: 50,
            child: Image(
                image: AssetImage('assets/images/xtw-removebg-preview.png'))),
        Container(
            height: 42,
            width: 42,
            child: Image(
                image: AssetImage('assets/images/insta-removebg-preview.png'))),
      ],
    );
  }
}
