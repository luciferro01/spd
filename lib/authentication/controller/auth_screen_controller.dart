// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class AuthScreenController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   RxDouble value = 0.0.obs;
//   late final AnimationController _animationController = AnimationController(
//     vsync: this,
//     duration: const Duration(seconds: 4),
//     lowerBound: 0.0,
//     upperBound: 30.0,
//   );
//   late final Animation<double> controller = CurvedAnimation(
//     parent: _animationController,
//     curve: Curves.easeInOutCubic,
//   );
//   void init() {
//     value.value = controller.value;
//   }
// }
