import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:spd/authentication/screens/authentication.dart';
import 'package:spd/onboarding_screen/screens/onboarding_screen.dart';
import 'constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'error/error_screen.dart';
import 'splash_screen.dart';

void main() async {
  // Widgets
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      theme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'proxima-soft',
            color: Colors.black87,
          ),
        ),
        brightness: Brightness.light,
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
          page: () => OnBoardingScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 1500),
        ),
        GetPage(
          name: Routes.authentication,
          page: () => AuthenticationScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
      unknownRoute: GetPage(
        name: Routes.errorScreen,
        page: () => ErrorScreen(),
        transition: Transition.cupertino,
      ),
      home: const SplashScreen(),
    );
  }
}
