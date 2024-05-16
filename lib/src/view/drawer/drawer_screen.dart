import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      backgroundColor: transparantdrawerColor,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          //=============== Profile =======================
          sizedBox(height * 0.050, width),
          _buildheader(height, width),
          //================= Home =================
          sizedBox(height * 0.050, width),

          _buildItem(
              icon: Icons.home_outlined, title: " H O M E", onTap: () {}),
          //==================Notification ===================
          _buildItem(
              icon: Icons.notifications_on_outlined,
              title: " N O T I F I C A T I O N",
              onTap: () {}),
          //====================== Profile ===========================
          _buildItem(
              icon: Icons.person_2_outlined,
              title: " P R O F I L E",
              onTap: () {}),
          //=============================== Discover ==========================
          _buildItem(
              icon: Icons.search, title: " D I S C O V E R", onTap: () {}),
          //=========================Collections ==============================
          _buildItem(
              icon: Icons.favorite,
              title: " C O L L E C T I O N S",
              onTap: () {}),
          //=============================Settings=============================
          _buildItem(
              icon: Icons.settings_outlined,
              title: " S E T T I N G S",
              onTap: () {}),

          //======================== Logout =============================
          _buildItem(
              icon: Icons.logout_outlined, title: " L O G O U T", onTap: () {})
        ],
      ),
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

  _buildItem({
    required IconData icon,
    required String title,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: backgroundColor,
      ),
      title: Text(
        title,
        style: whiteTextStyle,
      ),
      trailing: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.arrow_forward_ios,
          color: backgroundColor,
        ),
      ),
      minLeadingWidth: 5,
    );
  }
}
