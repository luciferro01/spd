import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:spd/QR_scanner_and_generator/pages/scan_result_page.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  String finalResults = "";
  Future _scanQR() async {
    String qrResults;
    try {
      qrResults = await FlutterBarcodeScanner.scanBarcode(
          '#f66666', 'Cancel', true, ScanMode.QR);
      debugPrint(qrResults);
    } on PlatformException {
      Navigator.pop(context);
      qrResults = 'failed';
      debugPrint(qrResults);
    }

    if (!mounted) return;
    setState(
      () {
        finalResults = qrResults;
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (builder) => ScanResult(
              result: finalResults,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        backgroundColor: const Color.fromARGB(255, 238, 243, 255),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Scan QR Code",
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              // FloatingActionButton(onPressed: _scanQR)
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: const Color(0xfff3555eb),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Material(
                child: InkWell(
                  onTap: _scanQR,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset.zero,
                            color: Color(0xfff3555eb),
                            blurRadius: 10,
                            spreadRadius: 2,
                            blurStyle: BlurStyle.inner)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                        "assets/images/QR_scanner_images/scanningQR.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
