import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view/smart%20checking/smart_checking.dart';
import 'package:abodein/src/view_Model/smart_cheking_provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManualVerification extends StatelessWidget {
  const ManualVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) => IdVerificationCard(
                height: height,
                width: width,
                fullName: person.fullNameController.text.toUpperCase(),
                nationality: person.nationalityController.text,
                dateofBirth: person.dateOfBirth.text,
                passportNumber: person.passportNoController.text,
                expiryDate: person.expiryDateController.text,
                sex: person.sexController.text,
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.06,
                bottom: height * 0.008,
              ),
              child: Text('Full Name'),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) => Textformfield(
                width,
                (enteredValue) => person.savingNameoPerson(enteredValue),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nationality'),
                        sizedBox(height * 0.008, 0.0),
                        Consumer<SmartChekingProvider>(
                          builder: (context, person, child) => Textformfield(
                            0,
                            (enteredValue) =>
                                person.savingPassportNoPerson(enteredValue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(0.0, width * 0.02),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Passport NO"),
                        sizedBox(height * 0.008, 0.0),
                        Consumer<SmartChekingProvider>(
                          builder: (context, person, child) => Textformfield(
                            0,
                            (enteredValue) =>
                                person.savingPassportNoPerson(enteredValue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.06,
                bottom: height * 0.008,
              ),
              child: Text('Mobile No'),
            ),
            Consumer<SmartChekingProvider>(
              builder: (context, person, child) =>
                  Consumer<SmartChekingProvider>(
                builder: (context, person, child) => Textformfield(
                  width,
                  (enteredValue) => person.savingPassportNoPerson(enteredValue),
                ),
              ),
            ),
            sizedBox(height * 0.03, 0.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("State"),
                        sizedBox(height * 0.008, 0.0),
                        Consumer<SmartChekingProvider>(
                          builder: (context, person, child) => Textformfield(
                            0,
                            (enteredValue) =>
                                person.savingPassportNoPerson(enteredValue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  sizedBox(0.0, width * 0.02),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("District"),
                        sizedBox(height * 0.008, 0.0),
                        Consumer<SmartChekingProvider>(
                          builder: (context, person, child) => Textformfield(
                            0,
                            (enteredValue) =>
                                person.savingPassportNoPerson(enteredValue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            sizedBox(height * 0.04, 0.0),
            Center(
              child: AppTextButton(
                text: 'Proceed',
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
    ValueChanged onchanged,
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
        onChanged: onchanged,
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
