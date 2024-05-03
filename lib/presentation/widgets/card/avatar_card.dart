// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/presentation/widgets_controller/custom_image_picker_controller.dart';
import 'package:flutter/material.dart';

import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/utils/helper/screen_size.dart';

class AvatarCard extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final bool isEditting;

  const AvatarCard({
    Key? key,
    this.height,
    this.width,
    this.child,
    required this.isEditting,
  }) : super(key: key);

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isPressed = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      onTapUp: (details) {
        if (widget.isEditting) {
          //TODO go to img picker
          getIt<CustomImagePickerController>().showPicker(context);
        } else {
          //TODO go to image full screen
          
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorName.primaryColor.withOpacity((isPressed ? 0.5 : 1)),
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.hardEdge,
        height: widget.height ?? getIt<ScreenUtil>().width / 3,
        width: widget.width ?? getIt<ScreenUtil>().width / 3,
        child: widget.child ??
            Assets.icon.user.svg(
              fit: BoxFit.fill,
            ),
      ),
    );
  }
}
