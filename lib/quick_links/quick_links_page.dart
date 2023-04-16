import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:spd/quick_links/links.dart';

class QuickLinksPage extends StatefulWidget {
  const QuickLinksPage({super.key});

  @override
  State<QuickLinksPage> createState() => _QuickLinksPageState();
}

class _QuickLinksPageState extends State<QuickLinksPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(
        //   leading: CupertinoButton(
        //     padding: const EdgeInsets.all(0),
        //     onPressed: () {},
        //     child: Icon(
        //       CupertinoIcons.chevron_back,
        //       size: size.width * 0.08,
        //       // color: Colors.black,
        //     ),
        //   ),
        //   middle: const Text(
        //     'Chat GPT',
        //     style: TextStyle(
        //       fontSize: 25,
        //       fontStyle: FontStyle.italic,
        //     ),
        //   ),
        // ),
        resizeToAvoidBottomInset: true,
        child: GridView.count(
          crossAxisCount: 2,
          children: Links.aiTools
              .map<Container>((e) => Container(
                    height: 30,
                    width: 40,
                    child: Text(e),
                  ))
              .toList(),
        ));
  }
}
