// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anime_list/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final bool enabled;
  final double? width;
  final Color color;
  final Color textColor;

  const RoundButton({
    Key? key,
    this.onTap,
    required this.title,
    required this.enabled,
    this.width,
    required this.color, required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.textGray, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: enabled ? color : Colors.grey,

      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          visualDensity: VisualDensity.standard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          // primary: enabled ? Colors.white : Colors.grey.shade600,
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: enabled ? textColor : Colors.grey.shade600,
              ),
        ),
      ),
    );
  }
}
