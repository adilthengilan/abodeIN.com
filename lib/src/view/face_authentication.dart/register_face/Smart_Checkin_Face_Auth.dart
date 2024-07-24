import 'dart:convert';

import 'package:abodein/src/view/face_authentication.dart/common/utils/extensions/size_extension.dart';
import 'package:abodein/src/view/face_authentication.dart/common/utils/extract_face_feature.dart';
import 'package:abodein/src/view/face_authentication.dart/common/views/camera_view.dart';
import 'package:abodein/src/view/face_authentication.dart/constants/theme.dart';
import 'package:abodein/src/view/face_authentication.dart/model/user_model.dart';
import 'package:abodein/src/view/face_authentication.dart/register_face/Face_Registering.dart';
import 'package:abodein/src/view/registration/login_page.dart';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class Smart_CheckIN_Face_Auth extends StatefulWidget {
  const Smart_CheckIN_Face_Auth({Key? key}) : super(key: key);

  @override
  State<Smart_CheckIN_Face_Auth> createState() =>
      _Smart_CheckIN_Face_AuthState();
}

class _Smart_CheckIN_Face_AuthState extends State<Smart_CheckIN_Face_Auth> {
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableLandmarks: true,
      performanceMode: FaceDetectorMode.accurate,
    ),
  );
  String? _image;
  FaceFeatures? _faceFeatures;

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            sizedBox(size.height * 0.12, 0.0),
            CameraView(
              onImage: (image) {
                setState(() {
                  _image = base64Encode(image);
                });
              },
              onInputImage: (inputImage) async {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(
                      color: accentColor,
                    ),
                  ),
                );
                _faceFeatures =
                    await extractFaceFeatures(inputImage, _faceDetector);
                setState(() {});
                if (mounted) Navigator.of(context).pop();
              },
            ),
            sizedBox(size.height * 0.01, 0.0),
            _image != null
                ? Center(
                    child: SizedBox(
                        width: size.width * 0.8,
                        height: size.height * 0.14,
                        child: Text(
                          " Please use the 'Continue'   Button to Verify Your Face",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        )),
                  )
                : SizedBox(
                    height: 0,
                  ),
            sizedBox(_image != null ? size.height * 0.15 : 0.0, 0.0),

            _image != null
                ? GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EnterDetailsView(
                            image: _image!,
                            faceFeatures: _faceFeatures!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      // margin: EdgeInsets.only(top: size.height * 0.3),
                      width: size.width * 0.8,
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 129, 95, 255),
                            Color.fromARGB(255, 63, 86, 255)
                          ],
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'Continue',
                        style: smallTextStyleBlack,
                      )),
                    ),
                  )
                : SizedBox()
            // TextButton(
            //     onPressed: () {
            //       Navigator.of(context).push(
            //         MaterialPageRoute(
            //           builder: (context) => EnterDetailsView(
            //             image: _image!,
            //             faceFeatures: _faceFeatures!,
            //           ),
            //         ),
            //       );
            //     },
            //     child: Text(
            //       'Start Registering',
            //       style: TextStyle(color: Colors.white),
            //     ))
          ],
        ),
      ),
    );
  }
}
