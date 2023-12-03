import 'package:anime_list/data/models/user_account_model.dart';
import 'package:anime_list/data/repositories/user_repository.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/screens/home_screen.dart';
import 'package:anime_list/presentation/screens/login_screen.dart';
import 'package:anime_list/presentation/screens/profile_screen.dart';
import 'package:anime_list/presentation/screens/register_screen.dart';
import 'package:anime_list/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_list/utils/helper/share_preferences.dart' as sharePref;

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => RegisterScreen(),
        );
      // case '/profile':
      //   print( "profile ${settings.arguments}");
      //   return MaterialPageRoute(
      //     builder: (_) => ProfileScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
    }
  }
}
