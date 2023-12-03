// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/presentation/widgets_controller/custom_progress_indicator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/animations/twist_progress_indicator.dart';
import 'package:anime_list/utils/helper/screen_size.dart';

//! DON'T use this widget directly, use it via it's controller
class CustomProgressIndicator extends StatelessWidget {
  CustomProgressIndicator({
    Key? key,
  }) : super(key: key);

  showLoading(BuildContext parentCtx) {
    showDialog(
        context: parentCtx,
        builder: ((loadingCtx) {
          return build(loadingCtx);
        })).then((value) {
      getIt<CustomProgressIndicatorController>().clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Center(
        child: Container(
          width: getIt<ScreenUtil>().width / 3 * 2,
          height: getIt<ScreenUtil>().width / 3 * 2,
          // color: Colors.black,
          decoration: BoxDecoration(
              border: Border.all(color: ColorName.textGray, width: 2),
              borderRadius: BorderRadius.circular(300),
              color: ColorName.backgroundAvatar),
          child: Center(
            child: Stack(
              children: [
                Assets.image.logo.image(
                  fit: BoxFit.fill,
                  height: 200,
                  width: 200,
                ),
                const TwistingAnimation(
                  size: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
