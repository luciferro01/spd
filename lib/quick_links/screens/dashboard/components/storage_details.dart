import 'package:flutter/cupertino.dart';
import 'package:whiteboard/whiteboard.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/paddings.dart';
// import 'chart.dart';
// import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  StarageDetails({
    Key? key,
  }) : super(key: key);
  // Create a controller
  final WhiteBoardController whiteBoardController = WhiteBoardController();
// Clear all the strokes
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: WhiteBoard(controller: whiteBoardController));
  }
}
