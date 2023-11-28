import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/presentation/widgets/drawer/custom_drawer.dart';
import 'package:anime_list/presentation/widgets/drawer/custom_drawer_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(
          drawerItems: [
            CustomDrawerItem(
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
              ontap: (() {}),
            ),
          ],
        ),
        appBar: AppBar(title: Text('text'), actions: [
          IconButton(
            onPressed: (() {}),
            icon: Assets.icon.user.svg(),
          )
        ]),
        body: Container());
  }
}
