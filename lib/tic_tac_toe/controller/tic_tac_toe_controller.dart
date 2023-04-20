import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

// import '../../constants/colors.dart';

class TicTacToeController extends GetxController {
  RxBool oTurn = true.obs;
  RxString turn = ''.obs;
  RxList turns = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ].obs;
  RxInt filledBoxes = 0.obs;

//On Tapping the Grid Container

  void onTap(int index, BuildContext context) {
    if (turns[index] != '') {
      return;
    } else if (turns[index] == '') {
      if (oTurn.value) {
        turns[index] = 'O';
        turn.value = 'X';
        filledBoxes.value++;
      } else {
        turns[index] = 'X';
        turn.value = 'O';
        filledBoxes.value++;
      }
      oTurn.value = !oTurn.value;
      checkWinner(context);
    }
  }

  void showWinnerDialog(String data, BuildContext context) {
    // Get.showSnackbar(
    //   GetSnackBar(
    //     animationDuration: const Duration(milliseconds: 500),
    //     isDismissible: true,
    //     // snackPosition: SnackPosition.TOP,
    //     backgroundColor: ticTacToeBackgroundColor,
    //     messageText: Column(
    //       children: [
    //         data != 'Draw'
    //             ? Text(
    //                 '$data!!',
    //                 style: const TextStyle(
    //                   fontSize: 60,
    //                   fontWeight: FontWeight.w800,
    //                 ),
    //               )
    //             : Text(
    //                 data,
    //                 style: const TextStyle(
    //                   fontSize: 60,
    //                   fontWeight: FontWeight.w800,
    //                 ),
    //               ),
    //         const Text(
    //           'Won the Game',
    //           style: TextStyle(
    //             fontSize: 30,
    //           ),
    //         ),
    //         CupertinoButton.filled(
    //           onPressed: reset,
    //           child: const Text('Play Again'),
    //         )
    //       ],
    //     ),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
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
                    data != 'Draw'
                        ? Text(
                            '$data!!',
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        : Text(
                            data,
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                    const Text(
                      'Won the Game',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    CupertinoButton.filled(
                      onPressed: () {
                        reset();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Play Again'),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  void checkWinner(BuildContext context) {
    if (turns[0] == turns[1] && turns[0] == turns[2] && turns[0] != '') {
      showWinnerDialog(turns[0], context);
    } else if (turns[3] == turns[4] && turns[3] == turns[5] && turns[3] != '') {
      showWinnerDialog(turns[3], context);
    } else if (turns[6] == turns[7] && turns[6] == turns[8] && turns[6] != '') {
      showWinnerDialog(turns[6], context);
    } else if (turns[0] == turns[3] && turns[0] == turns[6] && turns[0] != '') {
      showWinnerDialog(turns[0], context);
    } else if (turns[1] == turns[4] && turns[1] == turns[7] && turns[1] != '') {
      showWinnerDialog(turns[1], context);
    } else if (turns[2] == turns[4] && turns[2] == turns[6] && turns[2] != '') {
      showWinnerDialog(turns[2], context);
    } else if (turns[0] == turns[4] && turns[0] == turns[8] && turns[0] != '') {
      showWinnerDialog(turns[0], context);
    } else if (filledBoxes.value == 9) {
      showWinnerDialog('Draw', context);
    }
  }

  //On Reset
  void reset() {
    turns.value = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ].toList();
    filledBoxes.value = 0;
  }
}
