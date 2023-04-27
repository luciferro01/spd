import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // RxBool isOpened = false.obs;

  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  )..addListener(() {
      refresh();
    });
  late Animation<double> scaleAnimation = Tween<double>(begin: 1, end: 0.8)
      .animate(CurvedAnimation(
          parent: animationController, curve: Curves.fastOutSlowIn));
  late Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: animationController, curve: Curves.fastOutSlowIn));
}
