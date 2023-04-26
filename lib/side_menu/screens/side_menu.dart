// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class HomeScreenSideMenu extends StatelessWidget {
//   const HomeScreenSideMenu({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.amber,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           CupertinoListTile(
//             title: Text(
//               'Tic Tac Toe',
//               style: TextStyle(fontSize: 60, color: Colors.white),
//             ),
//             // leading: Image.asset(onbScreen1),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spd/tic_tac_toe/screens/tic_tac_toe_screen.dart';

import '../../../../constants/colors.dart';

class HomeScreenSideMenu extends StatelessWidget {
  const HomeScreenSideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/logo.png"),
        DrawerListTile(
          title: "Dashboard",
          svgSrc: "assets/icons/menu_dashbord.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
        DrawerListTile(
          title: "Gpt for students",
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
        DrawerListTile(
          title: "Notes and To-do",
          svgSrc: "assets/icons/menu_task.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
        DrawerListTile(
          title: "Tic Tac Toe",
          svgSrc: "assets/icons/menu_store.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
        DrawerListTile(
          title: "Notification",
          svgSrc: "assets/icons/menu_notification.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Profile",
          svgSrc: "assets/icons/menu_profile.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Settings",
          svgSrc: "assets/icons/menu_setting.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      onTap: press,
      leading: SvgPicture.asset(
        svgSrc,
        height: 16,
        color: softwhite,
      ),
      title: Text(
        title,
        style: const TextStyle(color: softBlack),
      ),
    );
  }
}
