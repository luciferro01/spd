// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spd/QR_scanner_and_generator/customize_qr_page.dart';
import 'package:path_provider/path_provider.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  GlobalKey globalKey = GlobalKey();
  DataToCustomize? receiveCustoms = DataToCustomize(
      DTCedges: false,
      DTCbgColor: Colors.black,
      DTCfgColor: const Color(0xff3555eb),
      DTCimage: null);

  final dataController = TextEditingController();
  CustomizePage() async {
    final modifiedData = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (builder) => CustomizeQR(
          customs: receiveCustoms,
        ),
      ),
    );
    if (modifiedData != null) {
      receiveCustoms = modifiedData;
      setState(() {});
    }
  }

  Widget GenerateQR() {
    setState(() {});
    return PrettyQr(
        size: 100,
        data: dataController.text.toString(),
        roundEdges: receiveCustoms!.DTCedges,
        elementColor: receiveCustoms!.DTCfgColor,
        image: (receiveCustoms!.DTCimage != null)
            ? Image.file(receiveCustoms!.DTCimage as File).image
            : null);
  }

  Future<void> _shareqr() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      final imageDev = await boundary.toImage();
      final bytes = await imageDev.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = bytes!.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file1 = '${tempDir.path}/image.png';
      File(file1).writeAsBytesSync(pngBytes);

      // ignore: deprecated_member_use
      await Share.shareFiles([file1],
          text: "Share the QR Code", subject: "link");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 238, 243, 255),
      child: Container(
        margin: EdgeInsets.only(top: height * 0.05),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Generate QR Code",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RepaintBoundary(
                      key: globalKey,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: receiveCustoms!.DTCbgColor,
                        ),
                        height: height / 3,
                        width: height / 3,
                        child: GenerateQR(),
                      ),
                    ),

                    SizedBox(
                      height: height * 0.06,
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: height / 10,
                      child: CupertinoTextField(
                        controller: dataController,
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 15, left: 20),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        prefix: const Padding(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            "Data",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        autofocus: false,
                        style: const TextStyle(fontSize: 20),
                        placeholder: "Enter Text or Link here",
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          cardButtons(
                              "Generate", "internet_icon.png", GenerateQR),
                          cardButtons("Share", "share_icon.png", _shareqr),
                          cardButtons("Customize QR code", "internet_icon.png",
                              CustomizePage),
                        ],
                      ),
                    ),
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [

                    //   ],
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // ),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/QR_scanner_images/$inputImage"),
              const SizedBox(
                height: 15,
              ),
              Text(
                textAlign: TextAlign.center,
                cardText,
                style: const TextStyle(
                  color: Color(0xff3555eb),
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataToCustomize {
  bool DTCedges = false;
  Color DTCfgColor = const Color(0xff3555eb);
  Color DTCbgColor = Colors.black;
  File? DTCimage;

  DataToCustomize(
      {required this.DTCedges,
      required this.DTCbgColor,
      required this.DTCfgColor,
      this.DTCimage});
}
