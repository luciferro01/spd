import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offNamed(Routes.onboardingScreen),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/super_app_logo.png", scale: 2.3),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Hero(
              tag: 'App Name',
              child: Text(
                "Super App",
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
