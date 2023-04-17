import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:spd/authentication/controller/auth_screen_controller.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/instance_manager.dart';
// import '../controller/auth_screen_controller.dart';

class AuthenticationScreen extends StatelessWidget {
  AuthenticationScreen({super.key});

  final AuthScreenController controller = Get.put(AuthScreenController());
  // AuthScreenController controller = AuthScreenController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -size.height * 0.04,
            child: Transform.rotate(
              angle: -10,
              child: Container(
                height: size.height * 1.0,
                width: size.width * 1.5,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(size.height * 0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.3,
            child: Transform.rotate(
              angle: 5.9,
              child: Container(
                height: size.height * 1.0,
                width: size.width * 1.4,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(size.height * 0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.46,
            child: Transform.rotate(
              angle: 8.9,
              child: Container(
                height: size.height * 1.0,
                width: size.width * 1.3,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(size.height * 0.1),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            child: Column(
              children: const [
                Text(
                  'Super App',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'A productive app.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    // fontWeight: ,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: size.height * 0.12,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                controller.signIn();
              },
              child: SizedBox(
                height: 60,
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Icon(CupertinoIcons.add),
                    Image.asset(
                      "assets/icons/google_icon.png",
                      scale: 2.6,
                    ),
                    const Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
