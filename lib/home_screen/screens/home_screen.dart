import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:spd/constants/image_strings.dart';
import 'package:spd/home_screen/models/home_screen_card_model.dart';
import '../../constants/gradients.dart';
import '../../constants/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List cards = [
    const HomeScreenCards(
        image: onbScreen1,
        appName: 'Gradient App',
        route: Routes.gradientApp,
        gradient: Gradients.happyFisher,
        descriptionText: 'An app to pick your favourite color with an ease'),
    const HomeScreenCards(
      image: onbScreen2,
      appName: 'Tic Tac Toe',
      route: Routes.splashScreen,
      descriptionText: 'Hello',
      gradient: Gradients.passionateRed,
    ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.aquaSplash,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.eternalConstance,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.healthyWater,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.morningSalad,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.nightSky,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.gentleCare,
    // ),
    // const HomeScreenCards(
    //   image: onbScreen3,
    //   appName: 'Tic Tac Toe',
    //   route: Routes.splashScreen,
    //   descriptionText: 'Hello',
    //   gradient: Gradients.viciousStance,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Super App',
          style: TextStyle(fontSize: 25),
        ),
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
  }
}
