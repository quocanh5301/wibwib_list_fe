import 'package:anime_list/exception.dart';
import 'package:anime_list/presentation/widgets/dialog/custom_dialog.dart';
import 'package:flutter/material.dart';

class CustomDialogController {
  CustomDialogController();
  CustomDialog? _currentCustomDialog;
  BuildContext? _currentCtx;

  clear() {
    _currentCtx = null;
    _currentCustomDialog = null;
  }

  showDialog(BuildContext parentCtx, CustomDialog customDialog) {
    if (_currentCustomDialog == null) {
      _currentCtx = parentCtx;
      _currentCustomDialog = customDialog;
      _currentCustomDialog!.show(_currentCtx!);
    } else {
      throw CustomException('Dialog already show at ${_currentCtx}');
    }
  }

  hideDialog() {
    if (_currentCustomDialog != null) {
      Navigator.of(_currentCtx!).pop();
    } else {
      throw CustomException('No dialog to hide at ${_currentCtx}');
    }
  }
}
