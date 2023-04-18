import 'package:flutter/cupertino.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            'Tic Tac Toe',
            style: TextStyle(fontSize: 25),
          ),
        ),
        child: Column(
          children: const [],
        ));
  }
}
