import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormProvider extends ChangeNotifier{
  String? imagePath;
  XFile? imageFile;

  void setImagePath(String? value) {
    imagePath = value;
    notifyListeners();
  }

  void setImageFile(XFile? value) {
    imageFile = value;
    notifyListeners();
  }
}