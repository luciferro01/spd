import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import './utils/colors.dart';
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
    // timer;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainColor,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   "spd.png",
            //   width: MediaQuery.of(context).size.width * 0.4,
            //   // height: 200,
            //   // width: 200,
            // ),
            Image(image: AssetImage('assets/spd.png')),
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
