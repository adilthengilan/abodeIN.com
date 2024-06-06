import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/smart_cheking_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManualVerification extends StatelessWidget {
  const ManualVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // formProvider.dispose();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBox(height * 0.06, 0.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              child: Row(
                children: [
                  Container(
                    height: height * 0.053,
                    width: width * 0.13,
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
                ],
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Text(
                'Smart Checking with Your Passport',
                style: mediumTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            sizedBox(height * 0.02, 0.0),
            Center(
                child: Text(
              'Click',
              style: smallTextStyle,
            )),
            Container(
              height: height * 0.35,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Verification Icon.jpg'),
                ),
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.065,
                bottom: height * 0.008,
              ),
              child: Text('Full Name'),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) => Textformfield(
                width,
                person.emailController
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.065,
                bottom: height * 0.008,
              ),
              child: Text("Email"),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) => Textformfield(
                width,
                person.emailController
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.065,
                bottom: height * 0.008,
              ),
              child: Text('Mobile No'),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) => Textformfield(
                width,
                person.mobileNoController
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.065,
                bottom: height * 0.008,
              ),
              child: Text('Address', style: smallTextStyle),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) =>
                  Consumer<SmartChekingProvider>(
                builder: (context, person, child) => Textformfield(
                  width,
                  person.addressController
                ),
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Center(
              child: AppTextButton(
                text: 'Proceed',
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 141, 45, 226),
                    Color.fromARGB(255, 75, 0, 224)
                  ],
                ),
                onPressed: () {},
                height: height,
                width: width,
              ),
            ),
            sizedBox(height * 0.03, 0.0),
          ],
        ),
      ),
    );
  }

  Widget Textformfield(
    double width,
    TextEditingController controller,
  ) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Color.fromARGB(255, 206, 206, 206),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.only(left: 20, top: 10),
        ),
      ),
    );
  }
}
