import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spd/constants/colors.dart';
import 'package:spd/tic_tac_toe/controller/tic_tac_toe_controller.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class TicTacToeScreen extends StatelessWidget {
  TicTacToeScreen({super.key});
  final controller = Get.put(TicTacToeController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      // backgroundColor: grey,
      // navigationBar: CupertinoNavigationBar(
      //   backgroundColor: grey,
      //   middle: Text(
      //     'Tic Tac Toe',
      //     style: TextStyle(fontSize: 25),
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: const Icon(CupertinoIcons.chevron_back, size: 30),
                  onPressed: () => Get.back(),
                ),
                const Spacer(flex: 1),
                const Text(
                  'Tic Tac Toe',
                  style: TextStyle(
                    color: softBlack,
                    fontSize: 25,
                  ),
                ),
                const Spacer(flex: 2)
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            margin: const EdgeInsets.all(35),
            height: height * 0.5,
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
                fontSize: 40,
              ),
            ),
          ),
          const Spacer(flex: 1),
          CupertinoButton.filled(
            onPressed: controller.reset,
            child: const Text(
              'Reset the game',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
