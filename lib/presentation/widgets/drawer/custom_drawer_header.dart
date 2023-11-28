// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';

class CustomDrawerHeader extends StatelessWidget {

  final Widget icon;
  final Widget title;
  final LinearGradient backroundGradientColor;


  const CustomDrawerHeader({
    Key? key,
    required this.icon,
    required this.title,
    required this.backroundGradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: backroundGradientColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          const SizedBox(width: 18),
          title,
        ],
      ),
    );
  }
}
