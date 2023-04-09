import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.rotate(
            angle: -0.8,
            child: Container(
              height: size.height * 1.0,
              width: size.height * 1.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(size.height * 0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
