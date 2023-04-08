import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../../constants/image_strings.dart';
import '../models/item_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<ItemData> data = [
    ItemData(
        image: onbScreen1,
        bgColor: Colors.amber,
        descriptionText: 'A one stop solution of all the apps you need',
        headingText: 'Welome to the Super App'),
    ItemData(
        image: onbScreen2,
        bgColor: Colors.green,
        descriptionText: 'Conatains all the Apps you need in your daily life',
        headingText: 'Productive'),
    ItemData(
        image: onbScreen3,
        bgColor: Colors.yellow,
        descriptionText: 'So are you ready to deep dive into this app',
        headingText: 'Dive into it'),
  ];
  LiquidController controller = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe.builder(
            enableLoop: false,
            onPageChangeCallback: currentPageChangeCallback,
            liquidController: controller,
            itemBuilder: ((context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                height: size.height * 1.0,
                color: data[index].bgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      data[index].image,
                      height: size.height * 0.5,
                      width: double.maxFinite,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          data[index].headingText,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          data[index].descriptionText,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${(index + 1)} / ${(data.length)}',
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.14,
                    ),
                  ],
                ),
              );
            }),
            itemCount: data.length,
            slideIconWidget: const Icon(
              CupertinoIcons.back,
              size: 30,
              color: Colors.black,
            ),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: size.height * 0.14,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  controller.jumpToPage(page: data.length - 1);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                height: size.height * 0.08,
                width: size.height * 0.08,
                child: const Icon(
                  CupertinoIcons.chevron_forward,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.09,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: data.length,
              effect: const ExpandingDotsEffect(),
            ),
          )
        ],
      ),
    );
  }

  void currentPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
