import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/screens/profile_screen.dart';
import 'package:anime_list/presentation/widgets/drawer/custom_drawer.dart';
import 'package:anime_list/presentation/widgets/drawer/custom_drawer_item.dart';
import 'package:anime_list/services/response_models/get_profileimage_response_model.dart';
import 'package:flutter/material.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

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
        appBar: AppBar(
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(width: 2)),
            title: Text(
              "Home",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            actions: [
              IconButton(
                onPressed: (() async {
                  UserDataModel? currentUser =
                      await sharePref.getUserFromSharedPreferences();
                  GetProfileImageResponseModel? imageResponse =
                      await getIt<IUserRepository>().getImage(
                    imageId: currentUser!.image!,
                  );
                  if (imageResponse != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                          currentUser: currentUser,
                          imgBase64: imageResponse.data),
                    ));
                  } else {
                    print(
                        "currentUser == null ${currentUser == null} imageResponse == null ${imageResponse == null}");
                  }
                }),
                icon: Assets.icon.user.svg(),
              )
            ]),
        body: Container());
  }
}
