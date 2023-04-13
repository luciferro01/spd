import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/image_strings.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo, scale: 2.3),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const Hero(
              tag: 'App Name',
              child: Text(
                "Super App",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
