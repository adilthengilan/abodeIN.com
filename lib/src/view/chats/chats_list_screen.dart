import 'package:abodein/src/view/chats/Support_Chat.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  final double height;
  final double width;
  const ChatsList({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Chats', style: mediumTextStyleLight),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBox(height * 0.02, width),
          Padding(
            padding: EdgeInsets.only(left: width * 0.03),
            child: Text('Chat with Our Services', style: smallTextStyleSemiBold),
          ),
          sizedBox(height * 0.01, width),
          ListView.builder(
            itemCount: 1,
            shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SupportChat(height: height, width: width),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.015,
                  horizontal: width * 0.03,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: height * 0.04,
                      backgroundColor: Colors.black,
                    ),
                    sizedBox(0.0, width * 0.04),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Support',style: mediumTextStyleLight),
                        Text('Your Last Message',style: smallTextStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
