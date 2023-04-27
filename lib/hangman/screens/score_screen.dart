import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spd/onboarding_screen/data/item_data.dart';
// import 'package:get/get.dart';
// import 'package:spd/hangman/controller/hangman_controller.dart';

import '../../constants/colors.dart';
import '../services/hangaman_databse.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put(HangmanController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final database = openDB();
    var query = scores(database);

    return CupertinoPageScaffold(
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
        ],
      ),
    );
  }
}
