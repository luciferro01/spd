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
            const Image(image: AssetImage('assets/spd.png')),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Hero(
              tag: 'App Name',
              child: Text(
                "SPD",
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
