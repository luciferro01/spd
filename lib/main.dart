import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:spd/QR_scanner_and_generator/qr_home_page.dart';
import 'package:spd/authentication/screens/authentication.dart';
import 'package:spd/developer_contribution/screens/developer_contribution_screen.dart';
import 'package:spd/gpt_advanced/main.dart';
import 'package:spd/gpt_assistant/chat_gpt/screens/chat_gpt_screen.dart';
import 'package:spd/gradients_app/screen/gradients_app.dart';
import 'package:spd/hangman/screens/hangman.dart';
import 'package:spd/home_screen/screens/home_screen.dart';
import 'package:spd/onboarding_screen/screens/onboarding_screen.dart';

import 'package:spd/quick_links/screens/main/main_screen.dart';
import 'package:spd/tic_tac_toe/screens/tic_tac_toe_screen.dart';
import 'constants/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'drawer/home_screen_drawer.dart';
import 'firebase_options.dart';
import 'error/error_screen.dart';

import 'quick_links/screens/main/components/side_menu.dart';
import 'splash_screen/screens/splash_screen.dart';
import 'youtube_playlist_length_calculator/screens/yt_len_cal.dart';

void main() async {
  // Widgets
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          page: () => SplashScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 2000),
        ),
        GetPage(
          name: Routes.onboardingScreen,
          page: () => OnBoardingScreen(),
          transition: Transition.circularReveal,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.authentication,
          page: () => AuthenticationScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.chatGpt,
          page: () => ChatGpt(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.chatPage,
          page: () => const ChatPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.gradientApp,
          page: () => const GradientApp(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.ytLengthCalculator,
          page: () => YtLengthCalculator(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.authentication,
          page: () => AuthenticationScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 1500),
        ),
        GetPage(
          name: Routes.chatPage,
          page: () => const ChatPage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 1500),
        ),
        GetPage(
          name: Routes.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.native,
          transitionDuration: const Duration(milliseconds: 1000),
        ),
        GetPage(
          name: Routes.gradientApp,
          page: () => const GradientApp(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.ytLengthCalculator,
          page: () => YtLengthCalculator(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.quickLinks,
          page: () => const MainScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.qrcodeScanner,
          page: () => const QrHomePage(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.ticTacToe,
          page: () => TicTacToeScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.hangman,
          page: () => Hangman(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
        GetPage(
          name: Routes.developer,
          page: () => DeveloperContributionScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 500),
        ),
      ],
      unknownRoute: GetPage(
        name: Routes.errorScreen,
        page: () => ErrorScreen(),
      ),
      home: HomeScreen(),
      // home: DeveloperContributionScreen(),
      // home: YtLengthCalculator(),
      // home: SideMenu(),
      // home: SideMenu(),
      // home: ChatGpt(),
    );
  }
}
