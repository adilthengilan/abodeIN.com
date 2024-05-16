import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/details/hotel_details_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  //============================== Items
  List<String> items = [
    " H O M E",
    " P R O F I L E",
    " H I S T O R Y",
    " R E W A R D S",
    " F A V O U R I T E S",
    " S E T T I N G S",
    " L O G O U T",
  ];
//============================ Icons
  List<IconData> icones = [
    Icons.home_outlined,
    Icons.person_2_outlined,
    Icons.history,
    Icons.card_giftcard_outlined,
    Icons.favorite_outline,
    Icons.settings_outlined,
    Icons.logout_outlined,
  ];
  //========================= Routes
  List<Widget> route = [
    DashBoard(),
    HotelDetailePage(),
    HotelDetailePage(),
    HotelDetailePage(),
    HotelDetailePage(),
    HotelDetailePage(),
    HotelDetailePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: transparantdrawerColor,
      width: width * 0.84,
      child: Column(children: [
        //=========================== Profile Section =====================================
        sizedBox(height * 0.10, width),
        _buildheader(height, width),
        //================================ Build Items ===================================
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              return ListTile(
                  title: Text(
                    items[i],
                    style: whiteTextStyle,
                  ),
                  leading: Icon(
                    icones[i],
                    color: backgroundColor,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: backgroundColor,
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => route[i])));
            },
          ),
        ),
      ]),
    );
  }

// ===================================== Header (Profile pic and name)==========================================
  _buildheader(height, width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile picture.jpg"),
          radius: 50,
        ),
        sizedBox(height * 0.02, width),
        Text(
          " Robert Browney",
          style: whiteMediumTextStyle,
        )
      ],
    );
  }
}
