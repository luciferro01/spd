import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spd/quick_links/screens/main/components/side_menu.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/paddings.dart';

import '../../../responsive.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          CupertinoButton(
              child: SvgPicture.asset("assets/icons/menu_setting.svg"),
              onPressed: () {}),
        if (!Responsive.isMobile(context))
          if (!Responsive.isMobile(context))
            Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        // Expanded(child: SearchField()),
        // ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: softwhite),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          SvgPicture.asset("assets/icons/menu_setting.svg"),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoTextField(
      decoration: BoxDecoration(
          // hintText: "Search",
          // fillColor: secondaryColor,
          // filled: true,
          // border: OutlineInputBorder(
          //   borderSide: BorderSide.none,
          //   borderRadius: const BorderRadius.all(Radius.circular(10)),
          // ),
          // suffixIcon: InkWell(
          //   onTap: () {},
          //   child: Container(
          //     padding: EdgeInsets.all(defaultPadding * 0.75),
          //     margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          //     decoration: BoxDecoration(
          //       color: primaryColor,
          //       borderRadius: const BorderRadius.all(Radius.circular(10)),
          //     ),
          //     child: SvgPicture.asset("assets/icons/Search.svg"),
          //   ),
          // ),
          ),
    );
  }
}
