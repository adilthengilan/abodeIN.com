import 'package:abodein/src/view/face_authentication.dart/register_face/Smart_Checkin_Face_Auth.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/services/services.dart';
import 'package:abodein/src/view_model/bools_provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final boolssProvider = Provider.of<boolsProvider>(context);

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      width: width * 0.84,
      child: Stack(children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: ListView(
            children: [
              //=============== Profile =======================
              sizedBox(height * 0.050, width),
              _buildHeader(height, width, context),
              //================= Home =================
              sizedBox(height * 0.060, width),
              Divider(),
              _buildItem(
                context: context,
                icon: CupertinoIcons.house_alt,
                color: Colors.pink,
                title: " Smart Check-IN",
                index: 0,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Smart_CheckIN_Face_Auth()));
                },
              ),
              sizedBox(height * 0.020, width),

              //====================== Profile ===========================
              // _buildItem(
              //     icon: CupertinoIcons.person_fill,
              //     color: const Color.fromARGB(255, 12, 137, 137),
              //     title: " Profile",
              //     index: 1,
              //     onTap: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => Profile()));
              //     }),
              //==================Notification ===================
              _buildItem(
                  icon: CupertinoIcons.dot_radiowaves_right,
                  color: Colors.orange,
                  title: " Smart Key",
                  index: 2,
                  onTap: () {},
                  context: context),
              sizedBox(height * 0.020, width),

              //=============================== Discover ==========================
              _buildItem(
                  icon: Icons.commit,
                  color: Color.fromARGB(255, 151, 197, 42),
                  title: " Services",
                  index: 3,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ServiceScreen()));
                  },
                  context: context),
              sizedBox(height * 0.020, width),

              //=========================Collections ==============================
              _buildItem(
                  context: context,
                  icon: CupertinoIcons.collections,
                  color: Colors.red,
                  title: " Recent Bookings",
                  index: 4,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FavoriteScreen()));
                  }),
              sizedBox(height * 0.020, width),

              //=============================== Share =============================
              _buildItem(
                  context: context,
                  icon: Icons.share,
                  color: Color.fromARGB(255, 237, 39, 221),
                  title: " Share",
                  index: 4,
                  onTap: () {
                    Share.share("com.example.abodein");
                  }),
              sizedBox(height * 0.020, width),

              //========================== About ==============================
              _buildItem(
                  context: context,
                  icon: CupertinoIcons.exclamationmark_circle,
                  color: Color.fromARGB(255, 60, 107, 248),
                  title: " About",
                  index: 4,
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => AboutScreen()));
                  }),
              sizedBox(height * 0.020, width),

              //====================================================== color scheme dark or light mode ==========================================================================
              sizedBox(height * 0.15, width),
              // GestureDetector(
              //   onTap: () {
              //     themeProvider.toggleTheme();
              //     themeProvider.saveSwitchValue();
              //   },
              //   child: Row(
              //     children: [
              //       sizedBox(0.0, width * 0.04),
              //       Icon(
              //         themeProvider.isDarkMode
              //             ? Icons.dark_mode
              //             : Icons.light_mode,
              //         color: themeProvider.isDarkMode
              //             ? Colors.white
              //             : Colors.black,
              //       ),
              //       sizedBox(0.0, width * 0.05),
              //       Text(
              //         themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode',
              //         style: GoogleFonts.poppins(
              //             fontSize: 18,
              //             color: themeProvider.isDarkMode
              //                 ? Colors.white
              //                 : Colors.black),
              //       )
              //     ],
              //   ),
              // ),
              // ThemeToggleWidget()
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
      ]),
    );
  }

  // ===================================== Header (Profile pic and name)==========================================
  Widget _buildHeader(height, width, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(" Logo",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.primary)),
            Text(" Description",
                style: GoogleFonts.poppins(
                    color: Theme.of(context).colorScheme.primary)),
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
      required Color color,
      required BuildContext context}) {
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
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
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
    final themeProvider = Provider.of<boolsProvider>(context);
    final size = MediaQuery.of(context).size;
    bool isDarkMode = themeProvider.isDarkMode;
    return Padding(
      padding:
          EdgeInsets.only(right: size.width * 0.66, top: size.height * 0.02),
      child: GestureDetector(
        onTap: () {
          themeProvider.toggleTheme();
        },
        child: CircleAvatar(
          backgroundColor: Color.fromARGB(0, 236, 236, 236),
          radius: 28,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       _buildOption(
          //         context,
          //         icon: Icons.wb_sunny,
          //         label: 'Light',
          //         isSelected: !isDarkMode,
          //         onTap: () {
          //           if (isDarkMode) themeProvider.toggleTheme();
          //         },
          //       ),
          //       _buildOption(
          //         context,
          //         icon: Icons.nights_stay,
          //         label: 'Dark',
          //         isSelected: isDarkMode,
          //         onTap: () {
          //           if (!isDarkMode) {
          //             themeProvider.toggleTheme();
          //           }
          //         },
          //       )
          //     ],
          //   ),
          // );
          child: Center(
            child: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode,
                size: 30, color: isDarkMode ? Colors.white : Colors.black),
          ),
        ),
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
        child: Container(
          child: Center(
            child: Icon(icon),
          ),
        ));
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('You are not logined'),
        content: Text('Please Login to take this service'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
            child: Text('Login'),
          ),
        ],
      );
    },
  );
}
