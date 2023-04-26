import 'package:get/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:spd/constants/colors.dart';
import '../../constants/apps.dart';

class HomeScreenCards extends StatelessWidget {
  final String image;
  final String route;
  final List<Color> gradient;
  final int index;
  const HomeScreenCards(
      {super.key,
      required this.image,
      required this.route,
      required this.gradient,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(route);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: softBlack,
                blurRadius: 4,
                blurStyle: BlurStyle.normal,
                offset: Offset(2, 6),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Image.asset(image, fit: BoxFit.contain),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    color: softwhite,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appList[index]['appName'],
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // FittedBox(
                      //   fit: BoxFit.cover,
                      //   child:
                      Text(
                        appList[index]['description'],
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                      // ),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
