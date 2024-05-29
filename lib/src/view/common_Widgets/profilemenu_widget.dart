import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onpressed});
  final String title;
  final IconData icon;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return ListTile(
      onTap: onpressed,
      leading: Container(
          margin: EdgeInsets.only(left: 20),
          height: 170,
          width: 320,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: greyShadeLight)
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withOpacity(0.3),
              //       blurRadius: 50,
              //       offset: Offset(8, 10)),
              // ],
              ),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            sizedBox(height, width * 0.07),
            Icon(
              icon,
              color: blueColorShadeMedium,
            ),
            sizedBox(height, width * 0.10),
            Text(
              title,
              style: whiteSmallTextStyle,
            )
          ])),
    );
  }
}