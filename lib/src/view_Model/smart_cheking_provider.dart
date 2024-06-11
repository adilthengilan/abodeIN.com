import 'package:abodein/src/view/common_Widgets/toast_messege.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SmartChekingProvider extends ChangeNotifier {
  String fullname = '';
  String mobileNumber = '';
  String email = '';
  String address = '';
  TextEditingController _fistNameController = TextEditingController();
  TextEditingController _mobileNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  TextEditingController get fistNameController => _fistNameController;
  TextEditingController get mobileNoController => _mobileNoController;
  TextEditingController get emailController => _emailController;
  TextEditingController get addressController => _addressController;

  void addingtoListDetails() {
  if (fistNameController.text != '' && _mobileNoController.text != '' && _addressController.text != '') {
    fullname = _fistNameController.text;
    mobileNumber = _mobileNoController.text;
    email = _emailController.text;
    address = _addressController.text;
    notifyListeners();
    }
    print('$fullname $mobileNumber $email $address');
  }






  File? image;
  final ImagePicker picker = ImagePicker();

  Future<void> openCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      toastmessege('No image captured.');
    }
    notifyListeners();
  }
}
