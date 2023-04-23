import 'package:flutter/cupertino.dart';

Widget hiddenWords(bool visible, String letter) {
  return Container(
    // margin: const EdgeInsets.all(10),
    alignment: Alignment.center,
    width: 60,
    height: 60,
    decoration: const BoxDecoration(
      color: Color(0xFF231954),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Visibility(
      visible: visible,
      child: Text(
        letter,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
