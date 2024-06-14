import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

bool isunlocked = false;
double persentage = 0;

class LoyalityProgramScreen extends StatelessWidget {
  final double height;
  final double width;
  const LoyalityProgramScreen({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_outlined),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              sizedBox(height * 0.01, width),
              Text('Hunt Your Own Tokens!', style: mediumTextStyle),
              sizedBox(height * 0.02, width),
              Text('Earn Loyalty Gifts by completing tasks and enjoy free stays',
                  style: smallTextStyle),
              sizedBox(height * 0.02, width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Level 1', style: smallTextStyle),
                  Text('1 / 3 ', style: smallTextStyle),
                ],
              ),
              sizedBox(height * 0.008, width),
              LinearProgressIndicator(
                color: Colors.deepPurpleAccent,
                value: 4 / 10,
                minHeight: height * 0.025,
                backgroundColor: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              sizedBox(height * 0.02, width),
              Text('Tokens', style: mediumTextStyleLight),
              sizedBox(height * 0.02, width),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: height * 0.0008,
                ),
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(
                    left: width * 0.023,
                    right: width * 0.023,
                    top: height * 0.025,
                    bottom: height * 0.005,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(88, 255, 235, 59),
                        Color.fromARGB(84, 187, 1, 255),
                        Color.fromARGB(118, 33, 149, 243),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: height * 0.085,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Icon(
                            IconlyBold.lock,
                            color: const Color.fromARGB(255, 222, 222, 222),
                            size: height * 0.08,
                          ),
                        ),
                      ),
                      sizedBox(height * 0.02, 0.0),
                      Text('Level ${index + 1}', style: smallTextStyleSemiBold),
                      sizedBox(height * 0.003, 0.0),
                      Text('Complete your 3 Bookings',
                          style: smallTextStyle, textAlign: TextAlign.center),
                      sizedBox(height * 0.01, 0.0),
                      Text('Locked', style: smallTextStyle),
                    ],
                  ),
                ),
              ),
              sizedBox(height * 0.06, 0.0),
            ],
          ),
        ),
      ),
    );
  }
}
