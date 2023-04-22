import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../controller/hangman_controller.dart';

class Hangman extends StatelessWidget {
  Hangman({super.key});
  final controller = Get.put(HangmanController());

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return const DefaultTextStyle(
      style: TextStyle(color: Colors.white),
      child: CupertinoPageScaffold(
        backgroundColor: ticTacToeBackgroundColor,
        child: Center(
          child: Text(
            'Working on it 😅',
            style: TextStyle(fontSize: 40),
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        // const Spacer(flex: 6),
        // Container(
        //   padding: const EdgeInsets.all(0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [
        //       Text(
        //         'Hangman',
        //         style: TextStyle(
        //           fontSize: 40,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Divider(
        //   height: 6,
        //   indent: width * 0.1,
        //   endIndent: width * 0.1,
        //   thickness: 4,
        // ),
        // const Spacer(flex: 2),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         const Icon(
        //           CupertinoIcons.heart_fill,
        //           size: 60,
        //           color: softwhite,
        //         ),
        //         Text(
        //           5.toString(),
        //           style: const TextStyle(
        //             color: softBlack,
        //             fontSize: 30,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //     Text(
        //       0.toString(),
        //       style: const TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.w600,
        //       ),
        //     ),
        //   ],
        // ),
        // Expanded(
        //   flex: 2,
        //   child: Stack(
        //     children: const [],
        //   ),
        // ),
        // Expanded(
        //   child: Container(
        //     alignment: Alignment.center,
        //     width: double.maxFinite,
        //     child: ListView.separated(
        //         scrollDirection: Axis.horizontal,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             width: 40,
        //             // height: 10,
        //             decoration: const BoxDecoration(
        //               border: Border(
        //                 bottom: BorderSide(
        //                   color: softwhite,
        //                   width: 10,
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //         separatorBuilder: (context, index) {
        //           return const SizedBox(
        //             width: 10,
        //             // height: 20,
        //           );
        //         },
        //         itemCount: 4),
        //   ),
        // ),
        // Expanded(
        //   flex: 4,
        //   child: GridView.builder(
        //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 6),
        //       itemBuilder: ((context, index) {
        //         return null;
        //       })),
        // )
        //   ],
        // ),
      ),
    );
  }
}
