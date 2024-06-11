import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        shadowColor: backgroundColor,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Settings', style: TextStyle(color: Colors.blue)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBox(height * 0.02, 0.0),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color.fromARGB(255, 216, 216, 216),
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: width * 0.04),
                itemBuilder: (context, index) {
                  String text = '';
                  switch (index) {
                    case 0:
                      text = "Account";
                    case 1:
                      text = 'Personal Detailes';
                    case 2:
                      text = 'Security';
                    case 3:
                      text = 'Email notifications';
                    case 4:
                      text = 'Questions to Properties';
                    case 5:
                      text = 'Language';
                    case 6:
                      text = 'About';
                    case 7:
                      text = 'Privacy policy';
                    case 8:
                      text = 'Smart Cheking';
                    case 9:
                      text = 'Terms And Conditions';
                    case 10:
                      text = 'Contact Costumer Service';

                      break;
                    default:
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.007),
                    decoration: BoxDecoration(
                      border: BorderDirectional(
                        bottom: BorderSide(
                          color:
                              index == 9 ? Colors.white : Colors.grey.shade100,
                        ),
                      ),
                    ),
                    child: index == 0 || index == 6
                        ? Text(text, style: smallTextStyleSemiBold)
                        : ListTile(
                            title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(text, style: smallTextStyle),
                              Icon(Icons.chevron_right)
                            ],
                          )),
                  );
                },
              ),
            ),
            sizedBox(height * 0.01, width),
            Text(
              'Version\n0.01',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
