import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:spd/home_screen/screens/home_screen.dart';
import 'package:spd/tic_tac_toe/screens/tic_tac_toe_screen.dart';

class HiddenAppDrawer extends StatefulWidget {
  const HiddenAppDrawer({super.key});

  @override
  State<HiddenAppDrawer> createState() => _HiddenAppDrawerState();
}

class _HiddenAppDrawerState extends State<HiddenAppDrawer> {
  late List<ScreenHiddenDrawer> pages = [
    ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: 'Tic Tac Toe',
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
      ),
      HomeScreen(),
    ),
  ];
  // pages.add(
  //   ScreenHiddenDrawer(
  //     ItemHiddenMenu(
  //       name: 'Tic Tac Toe',
  //       baseStyle: const TextStyle(),
  //       selectedStyle: const TextStyle(),
  //     ),
  //     TicTacToeScreen(),
  //   ),
  // );
  @override
  void initState() {
    // pages.add(
    //   ScreenHiddenDrawer(
    //     ItemHiddenMenu(
    //       name: 'Tic Tac Toe',
    //       baseStyle: const TextStyle(),
    //       selectedStyle: const TextStyle(),
    //     ),
    //     TicTacToeScreen(),
    //   ),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: Colors.deepPurple,
    );
  }
}
