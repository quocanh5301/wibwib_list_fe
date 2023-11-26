// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/presentation/widgets/progress_indicator/custom_progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicatorController {

  CustomProgressIndicatorController();

  showLoading(BuildContext parentCtx) {
    CustomProgressIndicator().showLoading(parentCtx);
  }

  hideLoading(BuildContext parentCtx) {
    CustomProgressIndicator().hideLoading(parentCtx);
  }
}
