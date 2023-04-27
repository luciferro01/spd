import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/hangman/components/figure.dart';
import 'package:spd/hangman/components/hidden_words.dart';
import 'package:spd/hangman/screens/score_screen.dart';

import '../../constants/colors.dart';
import '../controller/hangman_controller.dart';

class Hangman extends StatelessWidget {
  Hangman({super.key});
  final controller = Get.put(HangmanController());
  String alphabets = 'abcdefghijklmnopqrstuvwxyz';
  // List<dynamic> words = ['Hello', 'My', 'Name', 'Is', 'MOHIL', 'BANSAL'];
  List<Map<String, String>> words = [
    //Maximum word Limit is PANTHER
    {'type': 'Animal', 'word': 'Lion'},
    {'type': 'Fruits', 'word': 'Apple'},
    {'type': 'Country', 'word': 'india'},
    {'type': 'Country', 'word': 'USA'},
    {'type': 'Animal', 'word': 'Panther'},
    {'type': 'Fruits', 'word': 'Mango'},
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: CupertinoPageScaffold(
        backgroundColor: ticTacToeBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              child: const Text(
                'Hangman',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Divider(
              height: 6,
              indent: width * 0.1,
              endIndent: width * 0.1,
              thickness: 4,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              width: double.maxFinite,
              height: height * 0.35,
              child: Obx(
                () => Stack(
                  alignment: Alignment.center,
                  children: [
                    figureImage(
                        controller.tries >= 0, "assets/figures/hang.png"),
                    figureImage(
                        controller.tries >= 1, "assets/figures/head.png"),
                    figureImage(controller.tries >= 2, "assets/figures/rl.png"),
                    figureImage(controller.tries >= 3, "assets/figures/ll.png"),
                    figureImage(
                        controller.tries >= 4, "assets/figures/body.png"),
                    figureImage(controller.tries >= 5, "assets/figures/ra.png"),
                    figureImage(controller.tries >= 6, "assets/figures/la.png"),
                    Positioned(
                      top: 0,
                      right: 40,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              const Icon(
                                CupertinoIcons.heart_fill,
                                size: 50,
                                color: softBlack,
                              ),
                              Text(
                                controller.lives.value.toString(),
                                style: const TextStyle(
                                  // color: softBlack,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => Text(
                              controller.score.value.toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => controller.showHintDialog(context,
                                words[controller.index.value]['type']!),
                            child: const Icon(
                              CupertinoIcons.lightbulb_fill,
                              size: 40,
                              color: softBlack,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Get.to(() => const ScoreScreen()),
                            child: const Icon(
                              CupertinoIcons.book_solid,
                              size: 40,
                              color: softBlack,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ListView(
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  ...words[controller.index.value]['word']!
                      .split('')
                      .map(
                        (String e) => hiddenWords(
                            controller.selectedChar.contains(e.toUpperCase()),
                            e.toUpperCase()),
                      )
                      .toList(),
                  //   ],
                  // )
                  // ...words[controller.index.value]['word']!
                  //     .split('')
                  //     .map(
                  //       (String e) => hiddenWords(
                  //           controller.selectedChar.contains(e.toUpperCase()),
                  //           e.toUpperCase()),
                  //     )
                  //     .toList(),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SizedBox(
              height: height * 0.35,
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                children: alphabets
                    .split('')
                    .map(
                      (e) => Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: controller.selectedChar
                                    .contains(e.toUpperCase())
                                ? softBlack
                                : const Color(0xFF231954),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () => controller.pressed(
                            e.toUpperCase(),
                            words[controller.index.value]['word']
                                .toString()
                                .toUpperCase(),
                            context,
                          ),
                          child: Text(
                            e.toUpperCase(),
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                // itemCount: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
