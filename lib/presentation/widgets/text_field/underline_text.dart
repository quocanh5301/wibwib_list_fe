// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UnderlineText extends StatefulWidget {
  final void Function()? onTap;
  final String initialValue;
  final double? width;

  const UnderlineText({
    Key? key,
    this.onTap,
    required this.initialValue,
     this.width,
  }) : super(key: key);

  @override
  State<UnderlineText> createState() => _UnderlineTextState();
}

class _UnderlineTextState extends State<UnderlineText> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
        border: Border.all(color: ColorName.textGray, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: isPressed ? null : Colors.black,
        gradient: isPressed
            ? const LinearGradient(
                colors: <Color>[
                  ColorName.primaryGradientEnd,
                  ColorName.primaryColor,
                ],
              )
            : null,
      ),
        child: TextButton(
          onPressed: widget.onTap,
          child: Text(
            widget.initialValue,
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decorationThickness: 2,
              decorationColor:
                  isPressed ? ColorName.textGray : Colors.white,
              color: isPressed ? ColorName.textGray : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
