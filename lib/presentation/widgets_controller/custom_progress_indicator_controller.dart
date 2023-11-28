// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/exception.dart';
import 'package:anime_list/presentation/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicatorController {
  CustomProgressIndicatorController();
  CustomProgressIndicator? _curentCustomProgressIndicator;
  BuildContext? _currentCtx;

  clear() {
    _currentCtx = null;
    _curentCustomProgressIndicator = null;
  }

  showLoading(BuildContext parentCtx) {
    if (_curentCustomProgressIndicator == null) {
      _currentCtx = parentCtx;
      _curentCustomProgressIndicator = CustomProgressIndicator();
      _curentCustomProgressIndicator!.showLoading(_currentCtx!);
    } else {
      throw CustomException('Loading already show at ${_currentCtx}');
    }
  }

  hideLoading() {
    if (_curentCustomProgressIndicator != null) {
      Navigator.of(_currentCtx!).pop();
    } else {
      throw CustomException('No loading to hide at ${_currentCtx}');
    }
  }
}
