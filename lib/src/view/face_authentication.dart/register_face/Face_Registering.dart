import 'dart:developer';
import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/face_authentication.dart/constants/theme.dart';
import 'package:abodein/src/view/face_authentication.dart/model/user_model.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_model/Smart_Checkin_Provider.dart';
import 'package:abodein/utils/app_colors.dart';
import 'package:abodein/utils/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EnterDetailsView extends StatefulWidget {
  final String image;
  final FaceFeatures faceFeatures;
  const EnterDetailsView({
    Key? key,
    required this.image,
    required this.faceFeatures,
  }) : super(key: key);

  @override
  State<EnterDetailsView> createState() => _EnterDetailsViewState();
}

class _EnterDetailsViewState extends State<EnterDetailsView> {
  bool isRegistering = false;
  final _formFieldKey = GlobalKey<FormFieldState>();
  final TextEditingController _nameController = TextEditingController();

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
                onPressed: () {
                  _register_the_face(context, widget.image,
                      _nameController.text, widget.faceFeatures);
                },
                height: height,
                width: width,
                color: [],
              ),
            ),
            sizedBox(height * 0.03, 0.0),
          ],
        ),
      ),
    );
  }

  void _register_the_face(BuildContext context, image, name, faceFeatures) {
    FocusScope.of(context).unfocus();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: accentColor,
        ),
      ),
    );

    String userId = Uuid().v1();
    UserModel user = UserModel(
      id: userId,
      name: name.trim().toUpperCase(),
      image: image,
      registeredOn: DateTime.now().millisecondsSinceEpoch,
      faceFeatures: faceFeatures,
    );

    FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(user.toJson())
        .catchError((e) {
      log("Registration Error: $e");
      Navigator.of(context).pop();
    }).whenComplete(() {
      Navigator.of(context).pop();

      Future.delayed(const Duration(seconds: 1), () {
        //Reaches HomePage
        // Navigator.of(context)
        //   ..pop()
        //   ..pop()
        //   ..pop();
        Navigator.pop(context);
        Navigator.pop(context);
      });
    });
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
                      Text('John Smith', style: smallTextStyleBlack),
                      sizedBox(height * 0.018, 0.0),
                      Text('Kl25624**', style: smallTextStyleBlack),
                      sizedBox(height * 0.018, 0.0),
                      Text('9446892747', style: smallTextStyleBlack),
                      sizedBox(height * 0.018, 0.0),
                      Text("India, Kerala, Calicut",
                          style: smallTextStyleBlack),
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
