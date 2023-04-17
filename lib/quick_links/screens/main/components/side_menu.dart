import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Image.asset("assets/images/logo.png"),
        ),
        DrawerListTile(
          title: "Dashboard",
          svgSrc: "assets/icons/menu_dashbord.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Transaction",
          svgSrc: "assets/icons/menu_tran.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Task",
          svgSrc: "assets/icons/menu_task.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Documents",
          svgSrc: "assets/icons/menu_doc.svg",
          press: () {},
        ),
        DrawerListTile(
          title: "Store",
          svgSrc: "assets/icons/menu_store.svg",
          press: () {},
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
          press: () {},
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
