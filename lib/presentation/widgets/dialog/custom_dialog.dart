// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets_controller/custom_dialog_controller.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:flutter/material.dart';

//! DON'T use this widget directly, use it via it's controller
class CustomFloatingDialog extends StatelessWidget {
  final String title;
  final String mess;
  final List<Widget> actions;

  const CustomFloatingDialog({
    Key? key,
    required this.title,
    required this.mess,
    required this.actions,
  }) : super(key: key);

  show(BuildContext parentContext) {
    showDialog(
      barrierDismissible: false,
      context: parentContext,
      builder: (dialogContext) {
        return build(dialogContext);
      },
    ).then((value) {
      getIt<CustomDialogController>().clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withOpacity(0.2),
        child: Center(
          child: Container(
            width: getIt<ScreenUtil>().width / 3 * 2,
            height: getIt<ScreenUtil>().height / 2,
            // color: Colors.black,
            decoration: BoxDecoration(
                border: Border.all(color: ColorName.textGray, width: 2),
                borderRadius: BorderRadius.circular(14),
                color: ColorName.backgroundAvatar),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                      width: 80,
                      height: 80,
                      child: Assets.image.warning.image()),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.w200),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    mess,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: getIt<ScreenUtil>().height * 3 / 30,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: actions,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
