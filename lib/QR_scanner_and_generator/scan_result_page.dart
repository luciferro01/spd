import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanResult extends StatefulWidget {
  final String result;
  const ScanResult({super.key, required this.result});

  @override
  State<ScanResult> createState() => _ScanResultState();
}

class _ScanResultState extends State<ScanResult> {
//   DateTime now = DateTime.now();
// String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

  _copyFunction() {
    Clipboard.setData(ClipboardData(text: widget.result)).then((_) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const CupertinoActionSheet(
            message: Text("Copied to your clipboard"),
          );
        },
      );
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
    });
  }

  Future<void> _launchurl() async {
    var url = Uri.parse(widget.result);
    launchUrl(url, mode: LaunchMode.externalApplication);
  }

  _shareUrl() {
    // var url = Uri.parse(widget.result);
    Share.share(widget.result);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 238, 243, 255),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 238, 243, 255),
        middle: Text(
          "Scan Result",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (widget.result.isURL)
                      ? contentText(text: "URL", bold: true)
                      : contentText(text: "Text", bold: false),
                  // Text(DateTime.now().toIso8601String()),
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Divider(
                      height: 10,
                      color: Colors.black12,
                    ),
                  ),
                  contentText(text: widget.result, bold: false)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                cardButtons("Copy", "copy_icon.png", _copyFunction),
                cardButtons("Visit URL", "internet_icon.png", _launchurl),
                cardButtons("Share", "share_icon.png", _shareUrl)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardButtons(String cardText, String inputImage, ontap) {
    return Material(
      child: InkWell(
        onTap: ontap,
        child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    offset: Offset.zero,
                    color: Color(0xff3555eb),
                    blurRadius: 10,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.outer)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              // border:
              //     Border.all(color: Color(0xfff3555EB), width: 3)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/QR_scanner_images/$inputImage"),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  cardText,
                  style: const TextStyle(
                      color: Color(0xff3555eb),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ],
            )),
      ),
    );
  }

  Widget contentText({String text = 'ailed', bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 25,
            fontWeight: (bold) ? FontWeight.bold : FontWeight.normal),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
