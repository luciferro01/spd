import 'package:flutter/cupertino.dart';

Widget figureImage(bool visible, String path) {
  return Visibility(
    visible: visible,
    child: Image.asset(path),
  );
}
