import 'package:flutter/cupertino.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        child: Center(
      child: Text("Generator page"),
    ));
  }
}
