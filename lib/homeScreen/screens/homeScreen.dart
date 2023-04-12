import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:spd/constants/image_strings.dart';
import 'package:spd/homeScreen/models/home_screen_card_model.dart';

import '../../constants/routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List cards = [
    HomeScreenCards(
        image: onbScreen1,
        appName: 'TimePass',
        route: Routes.splashScreen,
        descriptionText: 'Hello'),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
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
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Container(
      //       margin: EdgeInsets.symmetric(
      //         horizontal: width * 0.1,
      //         // vertical: height * 0.0,
      //       ),
      //       height: height * 0.6,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(30),
      //         color: Colors.amber,
      //       ),
      //     )
      //   ],
      // )
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
