import 'package:flutter/material.dart';

class ContactDetailsProvider with ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String name = 'Mr.Thomas Miller';
  String email = 'thomasmillaer@gmail.com';
  String phone = '298578908';

  void updateContactDetails() {
    name = nameController.text;
    email = emailController.text;
    phone = phoneController.text;
    notifyListeners();
  }

  void setContactDetails(String name, String email, String phone) {
    nameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
    notifyListeners();
  }
}
