import 'package:abodein/src/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    //-----------------------SignUp Page Text Field Controllers-------------------------------
    //---------------------
    final TextEditingController email_controller = TextEditingController();
    final TextEditingController first_name = TextEditingController();
    final TextEditingController last_name = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController password_confirmation = TextEditingController();

    //-------------------------
//---------------------Media Query is for assign with responsive size--------------
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.14,
            ),
            Text('SignUp',
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold)),
            SizedBox(
              height: height * 0.03,
            ),
            //---------------------------------- Here are the Text Field ---------\
            //--------------------------------
            Input_Text_Field(email_controller, 'Email'),
            Input_Text_Field(first_name, 'First Name'),
            Input_Text_Field(last_name, 'Last Name'),
            Input_Text_Field(password, 'Password'),
            Input_Text_Field(password_confirmation, 'Confirm Password'),

            //------------------------------------
            InkWell(
              onTap: () {},
              child: Container(
                height: height * 0.07,
                margin: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Center(
                    child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.2,
                ),
                Text(
                  'Already have an account ?',
                  style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
                ),
                // SizedBox(
                //   width: width * 0.01,
                // ),
                // Text(
                //   'Login',
                //   style: GoogleFonts.poppins(
                //       color: Colors.blue,
                //       fontSize: 16,
                //       fontWeight: FontWeight.w500),
                // )
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style:
                          GoogleFonts.poppins(color: Colors.blue, fontSize: 16),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget Input_Text_Field(TextEditingController controller, hinttext) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
    child: Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromARGB(255, 206, 206, 206))),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hinttext,
            hintStyle: GoogleFonts.poppins(
                color: Colors.grey, fontWeight: FontWeight.w400),
            contentPadding: EdgeInsets.only(left: 20, top: 10)),
      ),
    ),
  );
}
