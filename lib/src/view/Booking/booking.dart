import 'package:abodein/src/view/Booking/calender.dart';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/dashBoard/dashboard_screen.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/calender_provider.dart';
import 'package:abodein/src/view_Model/contact_provider.dart';
import 'package:abodein/src/view_Model/dashboard_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    final calenderProvider =
        Provider.of<CalendarProvider>(context, listen: false);

    final bottomSheet = Provider.of<DashBoardProvider>(context, listen: false);

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
                  title: calenderProvider.checkingDate,
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
                  title: calenderProvider.checkoutDate,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookingCalendarPage()));
                  },
                )
              ],
            ),
            //-------------------------------------------------------------------------------------------------------------------------------------------------------------
            //==================================================== GUESTS AND ROOMS =========================================================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConfirmBox(
                    text: 'Guest',
                    title: ' ${bottomSheet.adults} Adults',
                    onTap: () {
                      showBottomSheet(context);
                    }),
                ConfirmBox(
                    text: 'Rooms',
                    title: '${bottomSheet.rooms} Rooms',
                    onTap: () {
                      showBottomSheet(context);
                    })
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
            gradient: LinearGradient(colors: [
              Color(0xff16d9e3), // Converted from #16d9e3 (starting color)
              Color(0xff30c7ec), // Converted from #30c7ec (middle color)
              Color(0xff46aef7),
            ])),
      ),
      //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    );
  }

//========================================================================================================
//================================ This Bottom Sheet func for Pick persons Count ==========================
//=========================================================================================================
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: backgroundColor,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }

  // ===================================== CONTACT DETAILS ==================================================
  Widget contactDetails(height, width, context) {
    return Consumer<ContactDetailsProvider>(
        builder: (context, contactdetails, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                  showBottomSheetcontact(context);
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
            contactdetails.name,
            style: BlackLightTextStyle,
          ),
          sizedBox(height * 0.01, width),
          Text(
            contactdetails.email,
            style: smallTextStyle,
          ),
          sizedBox(height * 0.01, width),
          Text(
            contactdetails.phone,
            style: smallTextStyle,
          )
        ],
      );
    });
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
//============================ Check in Check out Box ====================================================================

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
      child: Row(mainAxisSize: MainAxisSize.min, children: [
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

//========================================================================================================
//================================ This Bottom Sheet func for Pick persons Count ==========================
//=========================================================================================================
void showBottomSheetcontact(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: backgroundColor,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return BottomSheet();
    },
  );
}

// Bottom Sheet Content for Editing Contact Details
class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactdetails =
        Provider.of<ContactDetailsProvider>(context, listen: false);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16.0),
      height: height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Edit Contact Details', style: mediumTextStyle),
          sizedBox(height * 0.02, width),
          TextField(
            controller: contactdetails.nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          sizedBox(height * 0.02, width),
          TextField(
            controller: contactdetails.emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          sizedBox(height * 0.02, width),
          TextField(
            controller: contactdetails.phoneController,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            ),
          ),
          sizedBox(height * 0.02, width),
          AppTextButton(
            text: 'Save',
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 51, 192, 252),
                Color.fromARGB(255, 22, 228, 251),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
              contactdetails.updateContactDetails();
            },
            height: height * 0.20,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
