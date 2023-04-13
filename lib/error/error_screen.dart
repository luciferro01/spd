import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:spd/error/error_screen_controller.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({super.key});
  final controller = Get.put(ErrorScreenController());
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Error 404',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          ElevatedButton(
              onPressed: () => controller.logOut(),
              child: const Text('Log Out'))
        ],
      ),
    );
  }
}
