import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/drawer/drawer_item.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    ColorName.primaryGradientEnd,
                    ColorName.primaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Assets.icon.goku.svg(
                  color: Colors.black,
                  width: 70,
                  height: 70,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          DrawerItem(
              icon: Assets.icon.berserk.svg(
                color: Colors.black,
                width: 70,
                height: 70,
              ),
              title: Text(
                'Anime',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              backgroundColor: Colors.white,
              ontap: (() {})),
        ],
      ),
    );
  }
}
