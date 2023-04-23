import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/hangman/components/figure.dart';
import 'package:spd/hangman/components/hidden_words.dart';

import '../../constants/colors.dart';
import '../controller/hangman_controller.dart';

class Hangman extends StatelessWidget {
  Hangman({super.key});
  final controller = Get.put(HangmanController());
  String alphabets = 'abcdefghijklmnopqrstuvwxyz';
  List<dynamic> words = ['Hello', 'My', 'Name', 'Is', 'MOHIL', 'BANSAL'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.white),
      child: CupertinoPageScaffold(
        backgroundColor: ticTacToeBackgroundColor,
        // child: const Center(
        //   child: Text(
        //     'Working on it 😅',
        //     style: TextStyle(fontSize: 40),
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(flex: 6),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...words[controller.index.value]
                      .split('')
                      .map(
                        (String e) => hiddenWords(
                            controller.selectedChar.contains(e.toUpperCase()),
                            e.toUpperCase()),
                      )
                      .toList(),
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
                            words[controller.index.value]
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
