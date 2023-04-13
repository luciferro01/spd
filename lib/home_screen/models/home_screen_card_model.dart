import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:spd/constants/colors.dart';

class HomeScreenCards extends StatelessWidget {
  final String image;
  final String appName;
  final String route;
  final String descriptionText;
  final List<Color> gradient;
  const HomeScreenCards(
      {super.key,
      required this.image,
      required this.appName,
      required this.route,
      required this.descriptionText,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(route);
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return SplashScreen();
          // }));
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                  color: softBlack,
                  blurRadius: 4,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(2, 6)
                  // spreadRadius: 4,
                  )
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: softwhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //     spreadRadius: 0,
                    //     offset: Offset(0, -4),
                    //     color: softBlack,
                    //     blurStyle: BlurStyle.outer,
                    //     blurRadius: 34,
                    //   )
                    // ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appName,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        descriptionText,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
