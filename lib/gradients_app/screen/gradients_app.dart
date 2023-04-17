import 'package:flutter/cupertino.dart';
import 'package:spd/gradients_app/models/gradients_app_model.dart';
import '../data/gradients.dart';

class GradientApp extends StatelessWidget {
  const GradientApp({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'Gradient Picker',
          style: TextStyle(fontSize: 25),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: height * 0.04),
        width: double.infinity,
        height: double.maxFinite,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: height * 0.4,
              mainAxisSpacing: width * 0.05,
              crossAxisSpacing: width * 0.03),
          itemBuilder: ((context, index) => GradientAppModel(
                index: index,
                height: height * 0.17,
                gradient: gradients[index]['colorList'],
                graadientName: gradients[index]['gradientName'],
              )),
          itemCount: gradients.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
