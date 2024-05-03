import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/gen/assets.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/widgets/animations/fade_animation.dart';
import 'package:anime_list/presentation/widgets_controller/custom_dialog_controller.dart';
import 'package:anime_list/presentation/widgets_controller/custom_image_picker_controller.dart';
import 'package:anime_list/presentation/widgets_controller/custom_progress_indicator_controller.dart';
import 'package:anime_list/utils/helper/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:anime_list/utils/helper/share_preferences.dart'
    as sharePreferences;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  _initApp() async {
    initializeDependencies();
    getIt.registerSingleton<CustomProgressIndicatorController>(
        CustomProgressIndicatorController());
    getIt.registerSingleton<CustomDialogController>(CustomDialogController());
    getIt.registerSingleton<CustomImagePickerController>(
        CustomImagePickerController());

    await Future.delayed(const Duration(milliseconds: 1500));
    Future<UserDataModel?> getCurrentUser =
        sharePreferences.getUserFromSharedPreferences();

    Navigator.of(context).pushReplacementNamed('/home');
    getCurrentUser.then((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed('/login');
      } else {
        // sharePreferences.saveUserToSharedPreferences(user);
        Navigator.of(context).pushReplacementNamed('/home');
      }
    },);
    //TODO impliment app initialize here
  }

  _setScreenSize() {
    try {
      getIt<ScreenUtil>();
    } catch (e) {
      getIt.registerSingleton<ScreenUtil>(ScreenUtil(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ));
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _setScreenSize();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FadeAnimation(
            delay: 100,
            // onComplete: _finishAnimation,
            child: Assets.image.splashImage.image(),
          ),
        ),
      ),
    );
  }
}
