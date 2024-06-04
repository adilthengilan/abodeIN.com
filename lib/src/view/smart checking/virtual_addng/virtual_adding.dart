import 'package:abodein/src/view/common_Widgets/text_button.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/src/view_Model/smart_cheking_provider.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class VirtualAdding extends StatefulWidget {
  const VirtualAdding({super.key});

  @override
  State<VirtualAdding> createState() => _VirtualAddingState();
}

class _VirtualAddingState extends State<VirtualAdding> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          children: [
            sizedBox(height * 0.00, width),
            Container(
              height: height * 0.4,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.04),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/Verification Icon.jpg'),
                ),
              ),
            ),
            sizedBox(height * 0.06, 0.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Text(
                'Please scan your passport for identity verification.',
                style: mediumTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Consumer<SmartChekingProvider>(
                builder: (context, person, child) => 
                AppTextButton(
                  text: 'Varify With Ai',
                  onPressed: () => person.openCamera(),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 141, 45, 226),
                    Color.fromARGB(255, 75, 0, 224)
                  ]),
                  height: height,
                  width: width,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
