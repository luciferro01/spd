import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/constants/colors.dart';
import '../services/hangaman_databse.dart' as score_database;
import '../models/user_score.dart';

class HangmanController extends GetxController {
  final database = score_database.openDB();
  RxInt tries = 0.obs;
  RxInt index = 0.obs;
  Rx<Color> color = Colors.black87.obs;
  RxList selectedChar = [].obs;
  RxInt score = 0.obs;
  RxInt lives = 5.obs;
  String hiddenWord = '';

  pressed(String letter, String word, BuildContext context) {
    if (selectedChar.contains(letter)) {
      return null;
    } else {
      selectedChar.add(letter);
      debugPrint(selectedChar.toString());
      if (!word.split('').contains(letter)) {
        tries++;
        // selectedChar.removeLast();
        if (tries.value == 6) {
          showLossDialog(context);
        }
      }
      // print(word.splitMapJoin('').toString().split(''));
      // print(selectedChar.);
      // print(selectedChar.indexWhere(word.contains(other)));
      // var set2 = word.split('').toSet();
      // print(set2);
      // print(selectedChar.any((set2))
      // print(
      //     selectedChar.toSet().intersection(word.split('').toSet()).isNotEmpty);
      // print(selectedChar.toSet().containsAll(word.split('').toSet()));
      if (selectedChar.toSet().containsAll(word.split('').toSet())) {
        score.value++;
        selectedChar.value = [];
        tries.value = 0;
        index.value++;
      }
    }
  }

  void showLossDialog(BuildContext context) {
    showCupertinoDialog(
      context: (context),
      builder: ((context) => CupertinoAlertDialog(
            insetAnimationCurve: Curves.easeIn,
            actionScrollController: ScrollController(
              initialScrollOffset: 3,
              keepScrollOffset: true,
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const Text(
                      'You Lost one life',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(height: 10),
                    const Icon(
                      CupertinoIcons.heart_slash_fill,
                      color: softBlack,
                      size: 40,
                    ),
                    const SizedBox(height: 10),
                    CupertinoButton.filled(
                      onPressed: () {
                        tries.value = 0;
                        lives.value--;
                        selectedChar.value = [];
                        if (lives.value == 0) {
                          Score userScores = Score(
                              id: 1,
                              scoreDate: DateTime.now().toString(),
                              userScore: score.value);
                          score_database.manipulateDatabase(
                              userScores, database);
                          lives.value = 5;
                          score.value = 0;
                          index.value = 0;
                        }
                        Navigator.of(context).pop();
                      },
                      child: lives.value == 0
                          ? const Text('Oops You lost ')
                          : const Text('Play Again'),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  //Hint Dialog
  void showHintDialog(BuildContext context, String hint) {
    showCupertinoDialog(
      context: (context),
      builder: ((context) => CupertinoAlertDialog(
            insetAnimationCurve: Curves.easeIn,
            actionScrollController: ScrollController(
              initialScrollOffset: 3,
              keepScrollOffset: true,
            ),
            content: const Text(
              'The Hint is ',
              style: TextStyle(fontSize: 25),
            ),
            actions: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      hint,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    // const SizedBox(height: 20),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
