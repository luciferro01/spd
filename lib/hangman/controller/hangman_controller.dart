import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HangmanController extends GetxController {
  RxInt tries = 0.obs;
  Rx<Color> color = Colors.black87.obs;
  RxList selectedChar = [].obs;
  pressed(String letter, String word) {
    if (selectedChar.contains(letter)) {
      return null;
    } else {
      selectedChar.add(letter);
      debugPrint(selectedChar.toString());
      if (!word.split('').contains(letter)) {
        tries++;
      }
    }
  }
}
