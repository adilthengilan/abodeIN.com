import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class HotelDetailePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final detailpageProvider =
    //     Provider.of<HotelDetailProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
//_________________________________________________________________________________________________________________________________
//__________________________________________________________________backgound Image _______________________________________________
//_________________________________________________________________________________________________________________________________
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: Image.file(File(imagePath)),
                image: AssetImage(
                    "assets/images/ashim-d-silva-CwJb7ly-iqc-unsplash.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
//___________________________________________________________________________________________________________________________________________
//________________________________________AppBar____________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________________
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 25),
                height: 50,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: backgroundColor),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: primarycolor,
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 45),
                child: Text(
                  "Details",
                  style: mediumTextStyleLight,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, right: 25),
                height: 50,
                width: 55,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                    color: backgroundColor),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.notifications_none_outlined,
                      color: primarycolor,
                    )),
              ),
            ],
          ),
// __________________________________________________________________________________________________________________________________________________________
//_______________________________________Details Box_________________________________________________________________________________________________________________
//___________________________________________________________________________________________________________________________________________________________
          Container(
            margin: EdgeInsets.only(top: 415, left: 10),
            height: 360,
            width: 370,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: transparantColor),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> >  Map   >>>>>>>>>>>>>>>>>>>>
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 258),
                  height: height * 0.06,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.map_outlined,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        "Map",
                        style: whiteSmallTextStyle,
                      )
                    ],
                  ),
                ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>ratings>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Container(
                  margin: EdgeInsets.only(
                    bottom: 258,
                    left: 27,
                  ),
                  height: height * 0.06,
                  width: width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.star_border_outlined,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text("4.6", style: whiteSmallTextStyle)
                    ],
                  ),
                ),
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>3D view>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                Container(
                  margin: EdgeInsets.only(bottom: 258, right: 10),
                  height: height * 0.07,
                  width: width * 0.30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: transparantColor,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: height * 0.030,
                        backgroundColor: transparantColor,
                        child: Center(
                          child: Icon(
                            Icons.align_vertical_center_rounded,
                            color: backgroundColor,
                            size: 25,
                          ),
                        ),
                      ),
                      Text("3D View", style: whiteSmallTextStyle)
                    ],
                  ),
                ),
              ],
            ),
          ),
//_____________________________________________________________________________________________________________________

//SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS start Details From here SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
//_____________________________________________________________________________________________________________________
          Positioned(
            top: height * 0.65,
            left: width * 0.05,
            right: width * 0.075,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bangkok", style: whiteSmallTextStyle),
                        Text("Phuket", style: whiteMediumTextStyle)
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: "\$${599}",
                        style: whiteMediumTextStyle,
                        children: [
                          TextSpan(
                            text: "/${2}Persons",
                            style: whiteSmallTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis partu",
                    style: smallTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: height * 0.88,
              left: width * 0.05,
              right: width * 0.075,
              child: SwipeableButton(height, width))
        ],
      ),
    );
  }

  Widget SwipeableButton(height, width) {
    return Container(
      height: 70,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: const Color.fromARGB(255, 214, 212, 212)),
      child: Row(
        children: [
//       widget to be dragged____________________________________
          Draggable(
            axis: Axis.horizontal,
            feedback: Container(
              // feedback > the widget that actually gets dragged
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
            ),
            childWhenDragging: Container(
              height: 60,
              width: 60,
              color: Colors.transparent,
            ),
            child: Container(
              margin: EdgeInsets.only(left: 7),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.black),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: backgroundColor,
                ),
              ),
            ),
            // onDragEnd: (details) {
            //   value.moveToNextImage(context);
            //   // Navigator.push(
            //   //     context,
            //   //     MaterialPageRoute(
            //   //       builder: (context) => DashBoard(),
            //   //     ));
            // },
          ),

          sizedBox(height, width * 0.10),
          Text(
            "Book Now",
            style: blackSmallTextStyle,
          ),
          sizedBox(height, width * 0.20),

          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: greyShadeLight,
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            size: 16,
            color: greyShadeMedium,
          ),
        ],
      ),
    );
  }
}
