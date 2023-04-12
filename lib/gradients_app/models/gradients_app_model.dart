import 'package:flutter/widgets.dart';

class GradientAppModel extends StatelessWidget {
  final List<Color> gradient;
  final String graadientName;
  final double height;
  // final double width;
  const GradientAppModel({
    super.key,
    required this.gradient,
    required this.graadientName,
    required this.height,
    // required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: gradient),
          ),
        ),
        Text(
          // graadientName.contains(RegExp(r'[A-Z]')) ??
          graadientName,
          // .split(RegExp(r'[A-Z]'))
          // .join('${graadientName.allMatches(RegExp(r'[A-Z]'))}  '),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
