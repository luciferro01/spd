import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/constants/colors.dart';
import 'package:spd/tic_tac_toe/controller/tic_tac_toe_controller.dart';

class TicTacToeScreen extends StatelessWidget {
  TicTacToeScreen({super.key});
  final controller = Get.put(TicTacToeController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: ticTacToeBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 6),
          Container(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Tic Tac Toe',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 6,
            indent: width * 0.1,
            endIndent: width * 0.1,
            thickness: 4,
          ),
          const Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Player O',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.oScore.value.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Player X',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Obx(
                    () => Text(
                      controller.xScore.value.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(35),
            height: height * 0.46,
            width: double.maxFinite,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => controller.onTap(index, context),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: softBlack,
                      ),
                    ),
                    child: Obx(
                      () => Center(
                        child: Text(
                          controller.turns[index],
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Spacer(flex: 1),
          Obx(
            () => Text(
              '${controller.turn.value} Turn',
              style: const TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CupertinoButton.filled(
                padding: const EdgeInsets.all(15),
                borderRadius: BorderRadius.circular(10),
                onPressed: controller.reset,
                child: const Text(
                  'Reset the game',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              // sizedBox(wid),
              CupertinoButton(
                borderRadius: BorderRadius.circular(10),
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 30, right: 30),
                color: Colors.black,
                onPressed: controller.hardReset,
                child: const Text(
                  'Hard Reset',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
          const Spacer(
            flex: 8,
          ),
        ],
      ),
    );
  }
}
