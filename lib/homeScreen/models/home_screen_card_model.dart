import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:spd/constants/colors.dart';

class HomeScreenCards extends StatelessWidget {
  final String image;
  final String appName;
  final String route;
  final String descriptionText;
  const HomeScreenCards(
      {super.key,
      required this.image,
      required this.appName,
      required this.route,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.to(() => route),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: softwhite,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 0,
                        offset: Offset(0, -6),
                        color: softBlack,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        appName,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
