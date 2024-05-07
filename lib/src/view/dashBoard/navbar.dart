import 'package:abodein/src/Utils/app_colors.dart';
import 'package:abodein/src/Utils/style.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Elvis",
              style: smallTextStyle,
            ),
            accountEmail: Text(
              "elvis@gmail.com",
              style: smallTextStyle,
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/account_circle.png'),
              ),
            ),
            //________________________________________Backgound Image_______________________________
            decoration: BoxDecoration(
              color: backgroundColor,
              // image: DecorationImage(
              //     image: AssetImage(
              //         "assets/images/popular_hotels_image_2.png")),
            ),
          ),
          ListTile(
            leading: Icon(Icons.file_upload),
            title: Text("Upload Shot"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("Messages"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("LogOut"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
