import 'package:flutter/cupertino.dart';

Widget hiddenWords(bool visible, String letter) {
  return FittedBox(
    fit: BoxFit.contain,
    child: Container(
      alignment: Alignment.center,
      height: 60,
      width: 50,
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
    ),
  );
}
