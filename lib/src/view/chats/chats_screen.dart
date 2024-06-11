import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ChatsScreen extends StatelessWidget {
  final double height;
  final double width;
  const ChatsScreen({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Color.fromARGB(255, 220, 247, 255),
        shadowColor: Colors.grey,
        iconTheme: IconThemeData(color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Chats', style: mediumTextStyleLight),
            sizedBox(height * 0.002, 0.0),
            Text('24 / 24 custumer support', style: smallTextStyle)
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {}, child: Text('FAQ', style: mediumTextStyleLight))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          children: [
            Container(
              width: width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
            ),
            IconButton(color: Colors.black,
              onPressed: () {},
              icon: Icon(IconlyLight.send),
            )
          ],
        ),
      ),
    );
  }
}
