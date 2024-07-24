import 'dart:io';
import 'dart:typed_data';
import 'package:abodein/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class CameraView extends StatefulWidget {
  const CameraView(
      {Key? key, required this.onImage, required this.onInputImage})
      : super(key: key);

  final Function(Uint8List image) onImage;
  final Function(InputImage inputImage) onInputImage;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  File? _image;
  ImagePicker? _imagePicker;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        _image != null
            ? Center(
                child: CircleAvatar(
                  radius: 140,
                  backgroundColor: const Color(0xffD9D9D9),
                  backgroundImage: FileImage(_image!),
                ),
              )
            : SizedBox(
                height: size.height * 0.6,
                width: double.infinity,
                child: LottieBuilder.asset('assets/animations/face_auth.json'),
              ),
        // : CircleAvatar(
        //     radius: 60,
        //     backgroundColor: const Color(0xffD9D9D9),
        //     child: Icon(
        //       Icons.camera_alt,
        //       size: 40,
        //       color: const Color(0xff2E2E2E),
        //     ),
        //   ),
        _image != null
            ? SizedBox()
            : GestureDetector(
                onTap: _getImage,
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.05),
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
                    'Tap here to Start',
                    style: smallTextStyleBlack,
                  )),
                ),
              ),
      ],
    );
  }

  Future _getImage() async {
    setState(() {
      _image = null;
    });
    final pickedFile = await _imagePicker?.pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
      // imageQuality: 50,
    );
    if (pickedFile != null) {
      _setPickedFile(pickedFile);
    }
    setState(() {});
  }

  Future _setPickedFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _image = File(path);
    });

    Uint8List imageBytes = _image!.readAsBytesSync();
    widget.onImage(imageBytes);

    InputImage inputImage = InputImage.fromFilePath(path);
    widget.onInputImage(inputImage);
  }
}
