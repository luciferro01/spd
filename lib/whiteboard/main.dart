import 'package:flutter/widgets.dart';
import 'package:whiteboard/whiteboard.dart';

class Whiteboard extends StatefulWidget {
  const Whiteboard({super.key, required this.controller});
  final WhiteBoardController controller;
  @override
  State<Whiteboard> createState() => _WhiteboardState();
}

class _WhiteboardState extends State<Whiteboard> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "whiteboard",
      child: WhiteBoard(
          key: const Key("whiteboard"), controller: widget.controller),
    );
  }
}
