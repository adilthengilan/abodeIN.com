import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileProviders extends ChangeNotifier {
  File? image;
  // This is the image picker
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
    notifyListeners();
  }
}
