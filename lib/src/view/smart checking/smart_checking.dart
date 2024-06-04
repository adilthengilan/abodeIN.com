import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/smart%20checking/virtual_addng/virtual_adding.dart';
import 'package:abodein/src/view_Model/smart_cheking_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmartChecking extends StatelessWidget {
  const SmartChecking({super.key});

  @override
  Widget build(BuildContext context) {
    List passportList = [];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: width * 0.18,
        leading: Container(
          height: height * 0.053,
          width: width * 0.13,
          margin: EdgeInsets.only(
            left: width * 0.04,
            top: height * 0.01,
            bottom: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 3),
                color: Color.fromARGB(47, 80, 79, 79),
              ),
              BoxShadow(
                offset: Offset(-2, -1),
                color: Color.fromARGB(255, 216, 216, 216),
              ),
            ],
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Navigator.pop(context),
            child: Center(
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: passportList.isNotEmpty
            ? Column(
                children: [
                  sizedBox(height * 0.025, 0.0),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Checking Passport',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 2,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAdding(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(height * 0.025, 0.0),
                  for (int i = 0; i < 0; i++)
                    IdVerificationCard(
                      height: height,
                      width: width,
                      fullName: 'JohnSmith',
                      nationality: 'Indian',
                      dateofBirth: '06 - 08 - 2000',
                      passportNumber: 'Kl0859200',
                      expiryDate: '12-12-2025',
                      sex: 'Male',
                    ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sizedBox(height * 0.05, width),
                  Text(
                    'Please Cheking with Your Passport ID',
                    style: mediumTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.08),
                    child: Text('You Can add Your passport Id here. for Smart Checking',textAlign: TextAlign.center,),
                  ),
                  sizedBox(height /5, width),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VirtualAdding(),
                          ),
                        );
                      },
                      child: Container(
                        width: height * 0.2,
                        height:height* 0.2,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 57, 202, 255),
                              Colors.blue[800]!
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue[900]!.withOpacity(0.5),
                              offset: Offset(4, 4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              offset: Offset(-4, -4),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: height * 0.15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  sizedBox(height * 0.15, width)
                ],
              ),
      ),
    );
  }
}

class IdVerificationCard extends StatelessWidget {
  final String fullName;
  final String nationality;
  final String passportNumber;
  final String dateofBirth;
  final String expiryDate;
  final String sex;
  final double height;
  final double width;
  const IdVerificationCard({
    super.key,
    required this.height,
    required this.width,
    required this.fullName,
    required this.nationality,
    required this.dateofBirth,
    required this.passportNumber,
    required this.expiryDate,
    required this.sex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: width * 0.04,
        left: width * 0.04,
        bottom: height * 0.03,
      ),
      child: Container(
        height: height * 0.28,
        width: width,
        padding: EdgeInsets.only(
            top: height * 0.038, left: height * 0.038, bottom: height * 0.01),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 179, 178, 178),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/Card_BackGround.png'),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(-2, 8),
              blurRadius: 2,
              color: Color.fromARGB(113, 80, 79, 79),
            ),
            BoxShadow(
              offset: Offset(-1, 0),
              blurRadius: 2,
              color: Color.fromARGB(255, 133, 125, 125),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: height * 0.04,
                  backgroundColor: Colors.white38,
                  backgroundImage:
                      AssetImage("assets/images/Profile_person_Icon.png"),
                ),
                sizedBox(0.0, width * 0.06),
                Consumer<SmartChekingProvider>(
                  builder: (context, person, child) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedBox(height * 0.023, 0.0),
                      Text('John Smith', style: whiteSmallTextStyle),
                      sizedBox(height * 0.018, 0.0),
                      Text('Kl25624**', style: whiteSmallTextStyle),
                      sizedBox(height * 0.018, 0.0),
                      Text('9446892747', style: whiteSmallTextStyle),
                      sizedBox(height * 0.018, 0.0),
                      Text("India, Kerala, Calicut",
                          style: whiteSmallTextStyle),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
