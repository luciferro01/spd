import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spd/gpt_advanced/main.dart';
import 'package:spd/gpt_assistant/chat_gpt/screens/chat_gpt_screen.dart';
import 'package:spd/tic_tac_toe/screens/tic_tac_toe_screen.dart';

import '../../../../constants/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SvgPicture.asset("assets/icons/logo.svg"),
        DrawerListTile(
          title: "Tic Tac Toe",
          svgSrc: "assets/icons/menu_dashbord.svg",
          press: () {
            Get.to(() => TicTacToeScreen());
          },
        ),
        DrawerListTile(
          title: "Gpt for students",
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {
            Get.to(() => ChatPage());
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
          title: "Gradient decider",
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
      ),
      title: Text(
        title,
        style: const TextStyle(color: softBlack),
      ),
    );
  }
}
