import 'package:anime_list/exception.dart';
import 'package:anime_list/presentation/widgets/dialog/custom_image_picker_dialog.dart';
import 'package:anime_list/utils/constant/enum.dart';
import 'package:flutter/material.dart';

class CustomImagePickerController {
  CustomImagePickerController();
  CustomImagePickerDialog? _currentCustomImagePickerDialog;
  BuildContext? _currentCtx;

  clear() {
    _currentCtx = null;
    _currentCustomImagePickerDialog = null;
  }

  showPicker(BuildContext parentCtx, ImagePickerType imagePickerType) {
    if (_currentCustomImagePickerDialog == null) {
      _currentCtx = parentCtx;
      _currentCustomImagePickerDialog = CustomImagePickerDialog(imagePickerType: imagePickerType,);
      _currentCustomImagePickerDialog!.show(_currentCtx!);
    } else {
      throw CustomException('Picker already show at ${_currentCtx}');
    }
  }

  hidePicker() {
    if (_currentCustomImagePickerDialog != null) {
      Navigator.of(_currentCtx!).pop();
    } else {
      throw CustomException('No picker to hide at ${_currentCtx}');
    }
  }
}