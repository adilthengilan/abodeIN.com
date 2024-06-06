import 'package:abodein/src/view/Booking/calender.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      //----------------------------------------------------- app bar ------------------------------------------------------------------------
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Center(
          child: Text(
            'Booking',
            style: mediumTextStyle,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.favorite_border_sharp),
          )
        ],
      ),
      //-------------------------------------------------------------------------------------------------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //================================ ROOM type AND DETAILS ==============================================================================
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.02, right: width * 0.02, top: height * 0.03),
              child: Row(
                children: [
                  Container(
                    height: height * 0.20,
                    width: width * 0.40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/Screenshot 2024-05-31 145706.png'),
                            fit: BoxFit.fill)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.03,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Lux Hotel',
                            style: smallTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.01),
                          child: Text(
                            'Premium Room',
                            style: smallboldTextStyle,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 14),
                          width: 150,
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 24, 74, 105),
                                size: 20,
                              ),
                              Text('kochi,Eranakulam',
                                  style: greysmallTextStyle),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: width * 0.04),
                          child: Text(
                            '2 Nights',
                            style: greysmallTextStyle,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //-------------------------------------------------------------------------------------------------------------------------------------------------------------------
            //==================================================CHECKIN CHECKOUT==========================================================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConfirmBox(
                  text: 'Checkin',
                  title: '17 June 2024',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingCalendarPage()));
                    // showDialog(
                    //     context: context,
                    //     builder: (context) {
                    //       return AlertDialog(
                    //         content: BookingCalendarPage(),
                    //       );
                    //     });
                  },
                ),
                ConfirmBox(
                  text: 'Checkout',
                  title: '20 June 2024',
                  onTap: () {},
                )
              ],
            ),
            //-------------------------------------------------------------------------------------------------------------------------------------------------------------
            //==================================================== GUESTS AND ROOMS =========================================================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConfirmBox(text: 'Guest', title: '2 Guests', onTap: () {}),
                ConfirmBox(text: 'Rooms', title: '1 Room', onTap: () {})
              ],
            ),
            //-------------------------------------------------------------------------------------------------------------------------------------------------------------
            //====================================================== CONTACT DETAILS =======================================================================================
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.05,
                top: height * 0.03,
                right: width * 0.06,
              ),
              child: contactDetails(height, width, context),
            ),
            //----------------------------------------------------------------------------------------------------------------------------------------------------------------
            //================================================ PRICE DETAILS ==============================================================================================
            Divider(),
            priceDetails(height, width),
          ],
        ),
      ),
      //---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
      //=====================================================  PAYMENT BUTTON ============================================================================================================
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AppTextButton(
          text: "Pay Now",
          onPressed: () {},
          height: height,
          width: width,
          color: [
            Color(0xff16d9e3), // Converted from #16d9e3 (starting color)
            Color(0xff30c7ec), // Converted from #30c7ec (middle color)
            Color(0xff46aef7),
          ],
        ),
      ),
      //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    );
  }

  // ===================================== CONTACT DETAILS ==================================================
  Widget contactDetails(height, width, context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController mobilenumbercontrollor = TextEditingController();

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Contact Details',
              style: greysmallTextStyle,
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: backgroundColor,
                        title: const Text('Contact Details'),
                        content: SizedBox(
                          width: width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: namecontroller,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: transparantColor,
                                  hintText: 'Name',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                              sizedBox(height * 0.02, width),
                              TextFormField(
                                controller: emailcontroller,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: transparantColor,
                                  hintText: 'E mail',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                              sizedBox(height * 0.02, width),
                              TextFormField(
                                controller: mobilenumbercontrollor,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: transparantColor,
                                  hintText: 'Phone number',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none),
                                ),
                              ),
                              sizedBox(height * 0.02, width),
                              SizedBox(
                                width: width,
                                height: kToolbarHeight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 11, 92, 146),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                  child: Text(
                                    "Save",
                                    style: whitelightTextStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Icon(
                Icons.edit,
                color: blackShadeColor,
              ),
            )
          ],
        ),
        sizedBox(height * 0.02, width),
        Text(
          'Mr.Thomas Miller',
          style: BlackLightTextStyle,
        ),
        sizedBox(height * 0.01, width),
        Text(
          'thomasmillaer@gmail.com',
          style: smallTextStyle,
        ),
        sizedBox(height * 0.01, width),
        Text(
          '298578908',
          style: smallTextStyle,
        )
      ],
    ));
  }

//-----------------------------------------------------------------------------------------------------------------------------------------------------
  //================================ PRICE DETAILS =======================================
  Widget priceDetails(height, width) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.01,
              right: width * 0.06,
            ),
            child: Text(
              'Price Details',
              style: greysmallTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.01,
              right: width * 0.06,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'IDR 2700.000 × 2 Nights',
                  style: smallTextStyle,
                ),
                Text(
                  'IDR 550.000',
                  style: smallboldTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
//------------------------------------------------------------------------------------------------------------------------
//============================ Check in Check out Box ================================

class ConfirmBox extends StatelessWidget {
  final String text;
  final String title;
  final VoidCallback onTap;
  const ConfirmBox({
    super.key,
    required this.text,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.03,
        top: height * 0.03,
        right: width * 0.03,
      ),
      child: Row(children: [
        Container(
          height: height * 0.08,
          width: width * 0.40,
          decoration: BoxDecoration(boxShadow: [
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
          ], color: backgroundColor, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.02,
              top: height * 0.01,
              right: width * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: greyLightTextStyle,
                    ),
                    Text(
                      title,
                      style: smallTextStyle,
                    )
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.01,
                      ),
                      child: InkWell(
                        onTap: onTap,
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: blackShadeColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
      //---------------------------------------------------------------------------------------------------------------------------------------------------
    );
  }
}
