import 'package:flutter/cupertino.dart';

class ItemData {
  final String image;
  final Color bgColor;
  final String headingText;
  final String descriptionText;

  ItemData(
      {required this.image,
      required this.bgColor,
      required this.headingText,
      required this.descriptionText});
}
