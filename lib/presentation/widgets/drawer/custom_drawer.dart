// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/drawer/custom_drawer_header.dart';
import 'package:anime_list/utils/helper/screen_size.dart';

class CustomDrawer extends StatelessWidget {
  final List<Widget> drawerItems;

  CustomDrawer({
    Key? key,
    required this.drawerItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      width: getIt<ScreenUtil>().width / 5 * 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      backgroundColor: ColorName.textGray,
      child: Column(
        children: [
          CustomDrawerHeader(
            backroundGradientColor: const LinearGradient(
              colors: [
                ColorName.primaryGradientEnd,
                ColorName.primaryColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            icon: Assets.icon.goku.svg(
              color: Colors.black,
              width: 70,
              height: 70,
            ),
            title: Text(
              'Cooking Up!',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
          const SizedBox(height: 15),
          ...drawerItems,
        ],
      ),
    );
  }
}
