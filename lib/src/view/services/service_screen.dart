import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final dashboardProvider =
        Provider.of<DashBoardProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: _customAppBar(context),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Select your service',
                style: largeTextStyle,
              ),
            ),
            serviceList(height, width)
          ],
        ),
      ),
    );
  }

  Widget _customAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-0.3, 1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: greyShadeDark
                    // color: darktheme
                    //     ? Color.fromARGB(255, 165, 223, 254)
                    //     : Color.fromARGB(255, 248, 248, 248),
                    ),
              ],
              color: backgroundColor),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: blackShadeColor,
              )),
        ),
        Container(
          height: 50,
          width: 55,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    offset: Offset(-0.3, 1),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 0,
                    color: greyShadeDark
                    // color: darktheme
                    //     ? Color.fromARGB(255, 165, 223, 254)
                    //     : Color.fromARGB(255, 248, 248, 248),
                    ),
              ],
              color: backgroundColor),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.notifications_none_outlined,
                color: blackShadeColor,
              )),
        ),
      ],
    );
  }

//========================================  Service List ========================================
  Widget serviceList(height, width) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          String image = '';
          String text = '';
          Color color = Colors.transparent;
          VoidCallback onPressed = () {};
          switch (index) {
            case 0:
              image = 'assets/images/reserve-removebg-preview.png';
              text = 'Restuarant Services';
              color = Color.fromARGB(255, 59, 113, 125);
            case 1:
              image = 'assets/images/spa-towel-6895931-5655950.webp';
              text = 'Room Services';
              color = Color.fromARGB(200, 49, 33, 140);
            case 2:
              image = 'assets/images/lndry-removebg-preview.png';
              text = 'Luandry service';
              color = Color.fromARGB(210, 121, 22, 138);
            case 3:
              image = 'assets/images/Untitled_design-removebg-preview.png';
              text = 'Parking';
              color = orangeColor;
            case 4:
              image = 'assets/images/images__1_-removebg-preview.png';
              text = 'Other Amenities';
              color = Color.fromARGB(238, 149, 23, 14);
            case 5:
              image = 'assets/images/spa-towel-6895931-5655950.webp';
              text = 'Other Amenities';
              color = Colors.pink;
            default:
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height * 0.60,
              width: width * 0.50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: color.withOpacity(0.3),
                      offset: Offset(0, 25),
                      blurRadius: 3,
                      spreadRadius: -10)
                ],
                // boxShadow: [
                //   BoxShadow(
                //       offset: Offset(-0.3, 1),
                //       blurRadius: 2,
                //       blurStyle: BlurStyle.normal,
                //       spreadRadius: 0,
                //       color: greyShadeDark
                //       // color: darktheme
                //       //     ? Color.fromARGB(255, 165, 223, 254)
                //       //     : Color.fromARGB(255, 248, 248, 248),
                //       ),
                // ],
                color: color,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBox(height * 0.02, width),
                  Container(
                    child: Image(
                      image: AssetImage(image),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  sizedBox(height * 0.02, width),
                  Container(
                      width: 200,
                      child: Text(
                        text,
                        style: whiteLightTextStyle,
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
