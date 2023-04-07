import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:spd/onboarding_screen.dart';
import './utils/routes.dart';

import 'splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: Routes.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.circularReveal,
        ),
        GetPage(
          name: Routes.onboardingScreen,
          page: () => const OnBoardingScreen(),
          transition: Transition.leftToRight,
        ),
      ],
      home: const SplashScreen(),
    );
  }
}
