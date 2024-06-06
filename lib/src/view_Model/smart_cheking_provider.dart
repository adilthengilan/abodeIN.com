import 'package:abodein/src/view/common_Widgets/toast_messege.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

List passportList = [];

class SmartChekingProvider extends ChangeNotifier {
  TextEditingController fistNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void onChangedNameoPerson(String enteredValue) {
    fistNameController.text = enteredValue;
    notifyListeners();
  }

  void onChangessecondNamePerson(String enteredValue) {
    fistNameController.text = enteredValue;
    notifyListeners();
  }

  void onChangedMobileNoPerson(String enteredValue) {
    mobileNoController.text = enteredValue;
    notifyListeners();
  }

  void onChagedEmailPerson(String enteredValue) {
    emailController.text = enteredValue;
    notifyListeners();
  }

  void onChangedAddressPerson(String enteredValue) {
    addressController.text = enteredValue;
    notifyListeners();
  }

  @override
  void dispose(){
    fistNameController.dispose();
    mobileNoController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void addingtoListDetails(Name,MobileNo,Email,Address) {
    final contacttDetailes = {
      'Name' : Name,
      'MobileNumber' : MobileNo,
      'Email' : Email,
      'Address': Address
    };

    
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
