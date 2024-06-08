import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SmartChekingProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController passportNoController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  void savingNameoPerson(String enteredValue) {
    fullNameController.text = enteredValue;
    notifyListeners();
  }

  void savingPassportNoPerson(String enteredValue) {
    passportNoController.text = enteredValue;
    notifyListeners();
  }

  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      // toastmessege('No image captured.');
    }
    notifyListeners();
  }
}
