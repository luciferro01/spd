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
      index: 0,
      image: onbScreen1,
      route: Routes.gradientApp,
      gradient: Gradients.happyFisher,
    ),
    const HomeScreenCards(
      index: 1,
      image: onbScreen2,
      route: Routes.ticTacToe,
      gradient: Gradients.passionateRed,
    ),
    const HomeScreenCards(
      index: 2,
      image: onbScreen3,
      route: Routes.chatGpt,
      gradient: Gradients.aquaSplash,
    ),
    const HomeScreenCards(
      index: 3,
      image: onbScreen1,
      route: Routes.splashScreen,
      gradient: Gradients.eternalConstance,
    ),
    const HomeScreenCards(
      index: 4,
      image: onbScreen2,
      route: Routes.splashScreen,
      gradient: Gradients.healthyWater,
    ),
    const HomeScreenCards(
      index: 5,
      image: onbScreen2,
      route: Routes.splashScreen,
      gradient: Gradients.morningSalad,
    ),
    const HomeScreenCards(
      index: 6,
      image: qrCodeScanner,
      route: Routes.qrcodeScanner,
      gradient: Gradients.nightSky,
    ),
    const HomeScreenCards(
      index: 7,
      image: onbScreen2,
      route: Routes.ytLengthCalculator,
      gradient: Gradients.gentleCare,
    ),
    const HomeScreenCards(
      index: 8,
      image: onbScreen2,
      route: Routes.quickLinks,
      gradient: Gradients.viciousStance,
    ),
    // const HomeScreenCards(
    //   index: 9,
    //   image: onbScreen1,
    //   route: Routes.qrcodeScanner,
    //   gradient: Gradients.happyFisher,
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Super App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 10, right: 10, top: height * 0.12, bottom: height * 0.1),
            width: double.infinity,
            height: height * 0.8,
            child: CardSwiper(
              cardsCount: cards.length,
              cardBuilder: (context, index) => cards[index],
            ),
          ),
        ],
      ),
    );
    // );
  }
}
