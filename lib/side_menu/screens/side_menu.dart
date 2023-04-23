import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spd/constants/image_strings.dart';

class HomeScreenSideMenu extends StatelessWidget {
  const HomeScreenSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoListTile(
            title: Text(
              'Tic Tac Toe',
              style: TextStyle(fontSize: 60, color: Colors.white),
            ),
            // leading: Image.asset(onbScreen1),
          )
        ],
      ),
    );
  }
}
