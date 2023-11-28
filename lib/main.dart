import 'package:anime_list/gen/colors.gen.dart';
import 'package:anime_list/injection.dart';
import 'package:anime_list/presentation/screens/splash_screen.dart';
import 'package:anime_list/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
                primarySwatch: Colors.orange,
                textTheme: GoogleFonts.mulishTextTheme(
                  textTheme
                      .apply(
                        bodyColor: ColorName.textGray1,
                        displayColor: ColorName.textGray1,
                      )
                      .copyWith(
                        titleLarge:
                            textTheme.titleLarge!.copyWith(fontSize: 20),
                        titleMedium:
                            textTheme.titleMedium!.copyWith(fontSize: 16),
                        titleSmall:
                            textTheme.titleSmall!.copyWith(fontSize: 14),
                        bodyLarge:
                            textTheme.bodyLarge!.copyWith(fontSize: 16),
                        bodyMedium:
                            textTheme.bodyMedium!.copyWith(fontSize: 14),
                        bodySmall:
                            textTheme.bodySmall!.copyWith(fontSize: 12),
                        labelLarge:
                            textTheme.labelLarge!.copyWith(fontSize: 14),
                        labelSmall:
                            textTheme.labelLarge!.copyWith(fontSize: 10),
                      ),
                ),
              ),
      home: const SplashScreen(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
