import 'package:abodein/src/view/common_Widgets/text_field.dart';
import 'package:abodein/src/view_Model/hotel_detail_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final detailpageProvider =
        Provider.of<HotelDetailProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: blackShadeColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 17, top: 19),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: transparantColor),
                  child: Icon(
                    Icons.arrow_back,
                    color: backgroundColor,
                    size: 30,
                  ),
                ),
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/profile picture.jpg"),
                  radius: 30,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  width: 200,
                  height: 100,
                  child: Text(
                    "What are you  looking  for?",
                    style: whitelargeTextStyle,
                  ),
                )
              ],
            ),
            Row(
              children: [
                AppSearchBar(
                    controller: textEditingController,
                    hintText: "Search",
                    width: 400,
                    height: 760)
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Amenities",
                    style: whitelargeTextStyle,
                  ),
                )
              ],
            ),
            _serviceCard()
            // WhatWeOffer()

            // _serviceCard(),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     "Review",
            //     style: whitelargeTextStyle,
            //   ),
            // )
            // ServiceCard(
            //   title: 'Laundry Service',
            //   icon: Icons.local_laundry_service,
            //   onTap: () {
            //     // Handle laundry service functionality
            //     // This could navigate to a laundry service page
            //   },
            // ),
            // ServiceCard(
            //   title: 'Restaurant Reservations',
            //   icon: Icons.restaurant,
            //   onTap:si () {
            //     // Handle restaurant reservation functionality
            //     // This could navigate to a restaurant reservation page
            //   },
            // ),
            // ServiceCard(
            //   title: 'Other Facilities',
            //   icon: Icons.hotel,
            //   onTap: () {
            //     // Handle other facilities functionality
            //     // This could navigate to a page listing other facilities
            //   },
            // ),
          ],
        ),
      ),
    );
  }
//   //********************************SWIPEABLE BUTTON***************************** */

//   Widget SwipeableButton() {
//     return Container(
//       margin: EdgeInsets.only(left: 10),
//       height: 50,
//       width: 180,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(50), color: transparantColor),
//       child: Row(
//         children: [
// //       widget to be dragged____________________________________
//           Draggable(
//             axis: Axis.horizontal,
//             feedback: Container(
//               // feedback > the widget that actually gets dragged
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50), color: Colors.black),
//             ),
//             childWhenDragging: Container(
//               height: 50,
//               width: 50,
//               color: Colors.transparent,
//             ),
//             child: Container(
//               margin: EdgeInsets.only(left: 7),
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50), color: Colors.black),
//               child: Center(
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: backgroundColor,
//                 ),
//               ),
//             ),
//             onDragEnd: (details) {
//               // value.moveToNextImage(context);
//               // Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //       builder: (context) => DashBoard(),
//               //     ));
//             },
//           ),

//           Text(
//             " Get Start",
//             style: BlackLightTextStyle,
//           ),
//         ],
//       ),
//     );
//   }

  // The Profile Buttons Listing in the ListView Builder, it Has 7 buttons, and its Title, Icon, and Icon color it is in a Map List Button Components
  Widget _serviceCard() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        String image = 'assets/images/laundry-removebg-preview.png';
        String text = "";
        VoidCallback onPressed = () {};
        switch (index) {
          case 0:
            image = 'assets/images/laundry.png';
            text = "Do you need laundry Service";
            onPressed = () {};
          case 1:
            image = 'assets/images/reservation.png';
            text = "Make a Restaurant Reservation";
            onPressed = () {};
          case 2:
            image = 'assets/images/amenities.png';
            text = "Explore Other Amenities";
            onPressed = () {};

          default:
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  height: 160,
                  width: 360,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: transparantColor
                      // gradient: RadialGradient(colors: [
                      //   primarycolor,
                      //   pinkColor,
                      // ]),
                      ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            width: 200,
                            child: Text(
                              text,
                              style: blackMediumTextStyle,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 10),
                            child: Image(
                              image: AssetImage(image),
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: onPressed,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: transparantColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Get',
                                      style: BlackLightTextStyle,
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 30,
                                      color: blackShadeColor,
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      )

                      // Image(
                      //   image: AssetImage(
                      //     image,
                      //   ),
                      //   width: 200,
                      //   height: 100,
                      //   fit: BoxFit.fill,
                      // ),

                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Container(
                      //         height: 160,
                      //         child: Image.asset(
                      //           image,
                      //           alignment: Alignment.topRight,
                      //         )),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
