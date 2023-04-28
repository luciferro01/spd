import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:spd/constants/image_strings.dart';
import 'package:spd/home_screen/controllers/home_screen_controller.dart';
import 'package:spd/home_screen/models/home_screen_card_model.dart';
import '../../constants/gradients.dart';
import '../../constants/routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List cards = [
    const HomeScreenCards(
      index: 0,
      image: onbScreen2,
      route: Routes.ticTacToe,
      gradient: Gradients.passionateRed,
    ),
    const HomeScreenCards(
      index: 2,
      image: qrCodeScanner,
      route: Routes.qrcodeScanner,
      gradient: Gradients.nightSky,
    ),
    const HomeScreenCards(
      index: 5,
      image: onbScreen3,
      route: Routes.chatPage,
      gradient: Gradients.aquaSplash,
    ),
    const HomeScreenCards(
      index: 4,
      image: onbScreen2,
      route: Routes.hangman,
      gradient: Gradients.healthyWater,
    ),
    const HomeScreenCards(
      index: 3,
      image: onbScreen1,
      route: Routes.gradientApp,
      gradient: Gradients.eternalConstance,
    ),

    const HomeScreenCards(
      index: 1,
      image: onbScreen3,
      route: Routes.quickLinks,
      gradient: Gradients.aquaSplash,
    ),

    // const HomeScreenCards(
    //   index: 3,
    //   image: onbScreen1,
    //   route: Routes.splashScreen,
    //   gradient: Gradients.eternalConstance,
    // ),

    // const HomeScreenCards(
    //   index: 5,
    //   image: onbScreen2,
    //   route: Routes.splashScreen,
    //   gradient: Gradients.morningSalad,
    // ),

    // const HomeScreenCards(
    //   index: 7,
    //   image: onbScreen2,
    //   route: Routes.ytLengthCalculator,
    //   gradient: Gradients.gentleCare,
    // ),
    // const HomeScreenCards(
    //   index: 1,
    //   image: onbScreen2,
    //   route: Routes.quickLinks,
    //   gradient: Gradients.viciousStance,
    // ),
    // const HomeScreenCards(
    //   index: 9,
    //   image: onbScreen2,
    //   route: Routes.chatPage,
    //   gradient: Gradients.viciousStance,
    // ),
    const HomeScreenCards(
      index: 6,
      image: onbScreen1,
      route: Routes.developer,
      gradient: Gradients.happyFisher,
    ),
  ];

  var controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Super App',
          style: TextStyle(fontSize: 25),
        ),
        // leading: Icon(CupertinoIcons.list_bullet),
        // leading: Icon(CupertinoIcons.bars),
        // leading: Icon(CupertinoIcons.list_dash),
        // leading: Icon(CupertinoIcons.clear, color: softBlack),
        // leading: CupertinoButton(
        //   padding: const EdgeInsets.all(0),
        //   child: controller.isOpened.value
        //       ? const Icon(
        //           CupertinoIcons.clear_thick,
        //           size: 30,
        //         )
        //       : const Icon(
        //           CupertinoIcons.bars,
        //           size: 30,
        //         ),
        //   onPressed: () {
        //     controller.isOpened.value
        //         ? controller.isOpened.value = false
        //         : controller.isOpened.value = true;
        //   },
        // ),
      ),
      child: Container(
        margin: EdgeInsets.only(
            left: 10, right: 10, top: height * 0.12, bottom: height * 0.1),
        width: double.infinity,
        height: height * 0.8,
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index) => cards[index],
        ),
      ),
    );

    // return Material(
    // navigationBar: const CupertinoNavigationBar(
    //   middle: Text(
    //     'Super App',
    //     style: TextStyle(fontSize: 25),
    //   ),
    // leading: Icon(CupertinoIcons.list_bullet),
    // leading: Icon(CupertinoIcons.bars),
    // leading: Icon(CupertinoIcons.list_dash),
    // leading: Icon(CupertinoIcons.clear, color: softBlack),
    // leading: CupertinoButton(
    //   padding: const EdgeInsets.all(0),
    //   child: controller.isOpened.value
    //       ? const Icon(
    //           CupertinoIcons.clear_thick,
    //           size: 30,
    //         )
    //       : const Icon(
    //           CupertinoIcons.bars,
    //           size: 30,
    //         ),
    //   onPressed: () {
    //     controller.isOpened.value
    //         ? controller.isOpened.value = false
    //         : controller.isOpened.value = true;
    //   },
    // ),
    // ),
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Hello'),
    //     ),
    //     body: Container(
    //       margin: EdgeInsets.only(
    //           left: 10, right: 10, top: height * 0.12, bottom: height * 0.1),
    //       width: double.infinity,
    //       height: height * 0.8,
    //       child: CardSwiper(
    //         cardsCount: cards.length,
    //         cardBuilder: (context, index) => cards[index],
    //       ),
    //     ),
    //   ),
    // );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:get/get.dart';
// import 'package:spd/constants/colors.dart';
// import 'package:spd/constants/image_strings.dart';
// import 'package:spd/home_screen/controllers/home_screen_controller.dart';
// import 'package:spd/home_screen/models/home_screen_card_model.dart';
// import 'package:spd/side_menu/screens/side_menu.dart';
// import '../../constants/gradients.dart';
// import '../../constants/routes.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final List cards = [
//     const HomeScreenCards(
//       index: 0,
//       image: onbScreen2,
//       route: Routes.ticTacToe,
//       gradient: Gradients.passionateRed,
//     ),
//     const HomeScreenCards(
//       index: 4,
//       image: onbScreen2,
//       route: Routes.hangman,
//       gradient: Gradients.healthyWater,
//     ),
//     // const HomeScreenCards(
//     //   index: 2,
//     //   image: onbScreen3,
//     //   route: Routes.chatGpt,
//     //   gradient: Gradients.aquaSplash,
//     // ),
//     // const HomeScreenCards(
//     //   index: 3,
//     //   image: onbScreen1,
//     //   route: Routes.splashScreen,
//     //   gradient: Gradients.eternalConstance,
//     // ),

//     // const HomeScreenCards(
//     //   index: 5,
//     //   image: onbScreen2,
//     //   route: Routes.splashScreen,
//     //   gradient: Gradients.morningSalad,
//     // ),
//     const HomeScreenCards(
//       index: 2,
//       image: qrCodeScanner,
//       route: Routes.qrcodeScanner,
//       gradient: Gradients.nightSky,
//     ),
//     // const HomeScreenCards(
//     //   index: 7,
//     //   image: onbScreen2,
//     //   route: Routes.ytLengthCalculator,
//     //   gradient: Gradients.gentleCare,
//     // ),
//     const HomeScreenCards(
//       index: 1,
//       image: onbScreen2,
//       route: Routes.quickLinks,
//       gradient: Gradients.viciousStance,
//     ),
//     const HomeScreenCards(
//       index: 3,
//       image: onbScreen1,
//       route: Routes.gradientApp,
//       gradient: Gradients.happyFisher,
//     ),
//     //Still don't know about this one
//     // const HomeScreenCards(
//     //   index: 9,
//     //   image: onbScreen1,
//     //   route: Routes.qrcodeScanner,
//     //   gradient: Gradients.happyFisher,
//     // ),
//   ];

//   var controller = Get.put(HomeScreenController());

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text(
//           'Super App',
//           style: TextStyle(fontSize: 25),
//         ),
//         // leading: Icon(CupertinoIcons.list_bullet),
//         // leading: Icon(CupertinoIcons.bars),
//         // leading: Icon(CupertinoIcons.list_dash),
//         // leading: Icon(CupertinoIcons.clear, color: softBlack),
//         leading: Obx(
//           () => CupertinoButton(
//             padding: const EdgeInsets.all(0),
//             child: controller.isOpened.value
//                 ? const Icon(
//                     CupertinoIcons.clear_thick,
//                     size: 30,
//                   )
//                 : const Icon(
//                     CupertinoIcons.bars,
//                     size: 30,
//                   ),
//             onPressed: () {
//               controller.isOpened.value
//                   ? controller.isOpened.value = false
//                   : controller.isOpened.value = true;
//             },
//           ),
//         ),
//       ),
//       child: Obx(
//         () => Stack(
//           children: [
//             AnimatedPositioned(
//               width: width * 0.6,
//               duration: const Duration(milliseconds: 200),
//               curve: Curves.fastOutSlowIn,
//               left: controller.isOpened.value ? 0 : width * 1.0,
//               child: const HomeScreenSideMenu(),
//             ),
//             controller.isOpened.value
//                 ? Transform(
//                     transform: Matrix4.identity()
//                       ..setEntry(3, 2, 0.001)
//                       ..rotateY(1 * controller.animation.value -
//                           30 * (controller.animation.value) * 3.14 / 180),
//                     child: Transform.translate(
//                       offset: Offset(controller.animation.value * 265, 0),
//                       child: Transform.scale(
//                         scale: controller.scaleAnimation.value,
//                         child: Container(
//                           margin: EdgeInsets.only(
//                               left: 10,
//                               right: 10,
//                               top: height * 0.12,
//                               bottom: height * 0.1),
//                           width: double.infinity,
//                           height: height * 0.8,
//                           child: CardSwiper(
//                             cardsCount: cards.length,
//                             cardBuilder: (context, index) => cards[index],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 : Expanded(
//                     child: Container(
//                       margin: EdgeInsets.only(
//                           left: 10,
//                           right: 10,
//                           top: height * 0.12,
//                           bottom: height * 0.1),
//                       width: double.infinity,
//                       height: height * 0.8,
//                       child: CardSwiper(
//                         cardsCount: cards.length,
//                         cardBuilder: (context, index) => cards[index],
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//     // );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:get/get.dart';

// import 'package:spd/constants/image_strings.dart';
// import 'package:spd/home_screen/controllers/home_screen_controller.dart';
// import 'package:spd/home_screen/models/home_screen_card_model.dart';
// import 'package:spd/side_menu/screens/side_menu.dart';
// import '../../constants/gradients.dart';
// import '../../constants/routes.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   final List cards = [
//     const HomeScreenCards(
//       index: 0,
//       image: onbScreen2,
//       route: Routes.ticTacToe,
//       gradient: Gradients.passionateRed,
//     ),
//     const HomeScreenCards(
//       index: 4,
//       image: onbScreen2,
//       route: Routes.hangman,
//       gradient: Gradients.healthyWater,
//     ),
//     // const HomeScreenCards(
//     //   index: 2,
//     //   image: onbScreen3,
//     //   route: Routes.chatGpt,
//     //   gradient: Gradients.aquaSplash,
//     // ),
//     // const HomeScreenCards(
//     //   index: 3,
//     //   image: onbScreen1,
//     //   route: Routes.splashScreen,
//     //   gradient: Gradients.eternalConstance,
//     // ),

//     // const HomeScreenCards(
//     //   index: 5,
//     //   image: onbScreen2,
//     //   route: Routes.splashScreen,
//     //   gradient: Gradients.morningSalad,
//     // ),
//     const HomeScreenCards(
//       index: 2,
//       image: qrCodeScanner,
//       route: Routes.qrcodeScanner,
//       gradient: Gradients.nightSky,
//     ),
//     // const HomeScreenCards(
//     //   index: 7,
//     //   image: onbScreen2,
//     //   route: Routes.ytLengthCalculator,
//     //   gradient: Gradients.gentleCare,
//     // ),
//     const HomeScreenCards(
//       index: 1,
//       image: onbScreen2,
//       route: Routes.quickLinks,
//       gradient: Gradients.viciousStance,
//     ),
//     const HomeScreenCards(
//       index: 3,
//       image: onbScreen1,
//       route: Routes.gradientApp,
//       gradient: Gradients.happyFisher,
//     ),
//     //Still don't know about this one
//     // const HomeScreenCards(
//     //   index: 9,
//     //   image: onbScreen1,
//     //   route: Routes.qrcodeScanner,
//     //   gradient: Gradients.happyFisher,
//     // ),
//   ];

//   // var controller = Get.put(HomeScreenController());

//   bool isSideBarOpen = false;
//   late AnimationController _animationController;
//   late Animation<double> scalAnimation;
//   late Animation<double> animation;

//   @override
//   void initState() {
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 200))
//       ..addListener(
//         () {
//           setState(() {});
//         },
//       );
//     scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
//         parent: _animationController, curve: Curves.fastOutSlowIn));
//     animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
//         parent: _animationController, curve: Curves.fastOutSlowIn));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: const Text(
//           'Super App',
//           style: TextStyle(fontSize: 25),
//         ),
//         // leading: Icon(CupertinoIcons.list_bullet),
//         // leading: Icon(CupertinoIcons.bars),
//         // leading: Icon(CupertinoIcons.list_dash),
//         // leading: Icon(CupertinoIcons.clear, color: softBlack),
//         leading: CupertinoButton(
//           padding: const EdgeInsets.all(0),
//           child: isSideBarOpen
//               ? const Icon(
//                   CupertinoIcons.clear_thick,
//                   size: 30,
//                 )
//               : const Icon(
//                   CupertinoIcons.bars,
//                   size: 30,
//                 ),
//           onPressed: () {
//             isSideBarOpen ? isSideBarOpen = false : isSideBarOpen = true;
//           },
//         ),
//       ),
//       child: Stack(
//         children: [
//           AnimatedPositioned(
//             width: width * 0.6,
//             duration: const Duration(milliseconds: 200),
//             curve: Curves.fastOutSlowIn,
//             left: isSideBarOpen ? 0 : width * 1.0,
//             child: const HomeScreenSideMenu(),
//           ),
//           isSideBarOpen
//               ? Transform(
//                   transform: Matrix4.identity()
//                     ..setEntry(3, 2, 0.001)
//                     ..rotateY(1 * animation.value -
//                         30 * (animation.value) * 3.14 / 180),
//                   child: Transform.translate(
//                     offset: Offset(animation.value * 265, 0),
//                     child: Transform.scale(
//                       scale: scalAnimation.value,
//                       child: Container(
//                         margin: EdgeInsets.only(
//                             left: 10,
//                             right: 10,
//                             top: height * 0.12,
//                             bottom: height * 0.1),
//                         width: double.infinity,
//                         height: height * 0.8,
//                         child: CardSwiper(
//                           cardsCount: cards.length,
//                           cardBuilder: (context, index) => cards[index],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               : Expanded(
//                   child: Container(
//                     margin: EdgeInsets.only(
//                         left: 10,
//                         right: 10,
//                         top: height * 0.12,
//                         bottom: height * 0.1),
//                     width: double.infinity,
//                     height: height * 0.8,
//                     child: CardSwiper(
//                       cardsCount: cards.length,
//                       cardBuilder: (context, index) => cards[index],
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//     // );
//   }
// }
