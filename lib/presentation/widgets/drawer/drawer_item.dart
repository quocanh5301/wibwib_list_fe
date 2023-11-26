// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';

class DrawerItem extends StatefulWidget {
  final Widget icon;
  final Widget title;
  final Color backgroundColor;
  final Function() ontap;

  DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    required this.ontap,
  }) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: ((_) {
        setState(() {
          isTap = true;
        });
      }),
      onTapUp: (_) {
        setState(() {
          isTap = false;
        });
        widget.ontap.call();
      },
      onTapCancel: () {
        setState(() {
          isTap = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: ColorName.textGray, width: 2),
            borderRadius: BorderRadius.circular(14),
            color: isTap ? ColorName.primaryColor : widget.backgroundColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.icon,
            widget.title,
            //! trailing?
            const SizedBox(width: 25)
          ],
        ),
      ),
    );
  }
}
