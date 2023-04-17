import 'package:flutter/cupertino.dart';
import './scan_page.dart';
import './generator_page.dart';

class QrHomePage extends StatefulWidget {
  const QrHomePage({super.key});

  @override
  State<QrHomePage> createState() => _QrHomePageState();
}

class _QrHomePageState extends State<QrHomePage> {
  int pageIndex = 0;

  List<Widget> pages = [const ScanPage(), const GeneratorPage()];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.camera_viewfinder), label: "Scan"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.qrcode), label: "Generate")
        ],
        height: 80,
        backgroundColor: const Color.fromARGB(255, 238, 243, 255),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return pages[index];
          },
        );
      },
    );
  }
}
