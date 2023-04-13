import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:spd/constants/colors.dart';
import 'package:get/get.dart';

class GradientAppModel extends StatelessWidget {
  final int index;
  final List<Color> gradient;
  final String graadientName;
  final double height;
  // final double width;
  const GradientAppModel({
    super.key,
    required this.gradient,
    required this.graadientName,
    required this.height,
    required this.index,
    // required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: FlipCard(
            front: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: gradient),
              ),
            ),
            back: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(colors: gradient),
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(
                          // text: gradient[0].toString().split('0xff').join('#'),
                          text: gradient.toString().split('0xff').join('#'),
                        ),
                      );
                      Get.showSnackbar(
                        GetSnackBar(
                          animationDuration: const Duration(seconds: 1),
                          duration: const Duration(milliseconds: 1500),
                          isDismissible: true,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          boxShadows: const [
                            BoxShadow(color: softwhite, blurRadius: 8)
                            // BoxShadow(
                            //     color: gradient[0],
                            //     blurRadius: 2,
                            //     spreadRadius: 4),
                            // BoxShadow(
                            //   color: gradient[1],
                            // )
                          ],
                          messageText: Text(
                            '${gradient.toString().split('0xff').join('#')} copied',
                            style:
                                const TextStyle(color: softwhite, fontSize: 19),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          borderRadius: 20,
                          backgroundGradient: LinearGradient(colors: gradient),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          gradient[0].toString().split('0xff').join('#'),
                          style:
                              const TextStyle(fontSize: 20, color: softwhite),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          gradient[1].toString().split('0xff').join('#'),
                          style:
                              const TextStyle(fontSize: 20, color: softwhite),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          // graadientName.contains(RegExp(r'[A-Z]')) ??
          graadientName,
          // .split(RegExp(r'[A-Z]'))
          // .join('${graadientName.allMatches(RegExp(r'[A-Z]'))}  '),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
