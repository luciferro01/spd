import 'package:flutter/material.dart';
import 'package:spd/quick_links/screens/main/main_screen.dart';

class QuickLinksPage extends StatefulWidget {
  const QuickLinksPage({super.key});

  @override
  State<QuickLinksPage> createState() => _QuickLinksPageState();
}

class _QuickLinksPageState extends State<QuickLinksPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainScreen(),
    );
  }
}
