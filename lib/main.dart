import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:spd/onboarding_screen.dart';
import './utils/routes.dart';

import 'splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: Routes.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 2000),
        ),
        GetPage(
          name: Routes.onboardingScreen,
          page: () => const OnBoardingScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 1500),
        ),
      ],
      home: const SplashScreen(),
    );
  }
}
