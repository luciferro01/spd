import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'generator_page.dart';

class CustomizeQR extends StatefulWidget {
  DataToCustomize? customs;
  CustomizeQR({super.key, this.customs});

  @override
  State<CustomizeQR> createState() => _CustomizeQRState();
}

class _CustomizeQRState extends State<CustomizeQR> {
  late bool roundEdges = widget.customs?.DTCedges ?? false;
  late Color selectedFGColor = widget.customs!.DTCfgColor;
  late Color selectedBGcolor = widget.customs!.DTCbgColor;
  late File? _image = widget.customs!.DTCimage;

  Future pickImage() async {
    try {
      _image = null;
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Future colorPicker(Color selectedColor) async {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        debugPrint("called");
        return CupertinoAlertDialog(
          title: const Text(
            "Pick a color",
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                if (selectedColor == selectedFGColor) {
                  setState(() {
                    selectedColor = color;
                    selectedFGColor = selectedColor;
                  });
                } else {
                  setState(() {
                    selectedColor = color;
                    selectedBGcolor = selectedColor;
                  });
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color.fromARGB(255, 238, 243, 255),
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 238, 243, 255),
        middle: Text(
          "Customize QR Code",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add logo",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            (_image != null) ? null : pickImage();
                          },
                          child: (_image != null)
                              ? const Icon(
                                  CupertinoIcons.photo_on_rectangle,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  CupertinoIcons.photo_on_rectangle,
                                ),
                        ),
                        CupertinoButton(
                            child: const Icon(CupertinoIcons.delete),
                            onPressed: () {
                              setState(() {
                                _image = null;
                              });
                            }),
                      ],
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 7,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset.zero,
                            blurStyle: BlurStyle.solid,
                            color: Colors.white70,
                            blurRadius: 10,
                            spreadRadius: 4,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff3555eb),
                      ),
                      child: (_image != null)
                          ? Image.file(
                              _image as File,
                              fit: BoxFit.cover,
                            )
                          : const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Logo\nPreview",
                                  style: TextStyle(fontSize: 11),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Rounded edges",
                  style: TextStyle(fontSize: 25),
                ),
                CupertinoSwitch(
                  activeColor: const Color(0xff3555eb),
                  value: roundEdges,
                  onChanged: (value) {
                    roundEdges = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Foreground Colour",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                        child: const Icon(CupertinoIcons.paintbrush),
                        onPressed: () {
                          colorPicker(selectedFGColor);
                        }),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset.zero,
                            blurStyle: BlurStyle.solid,
                            color: Colors.white70,
                            blurRadius: 10,
                            spreadRadius: 4,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: selectedFGColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Background Colour",
                  style: TextStyle(fontSize: 25),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                        child: const Icon(CupertinoIcons.paintbrush),
                        onPressed: () {
                          colorPicker(selectedBGcolor);
                        }),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset.zero,
                            blurStyle: BlurStyle.solid,
                            color: Colors.white70,
                            blurRadius: 10,
                            spreadRadius: 4,
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: selectedBGcolor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              final _modifiedData = DataToCustomize(
                  DTCedges: roundEdges,
                  DTCbgColor: selectedBGcolor,
                  DTCfgColor: selectedFGColor,
                  DTCimage: _image);
              setState(() {});
              // Navigator.of(context).push(
              //     CupertinoPageRoute(builder: (builder) => GeneratorPage()));
              Navigator.of(context).pop(_modifiedData);
            },
            label: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
