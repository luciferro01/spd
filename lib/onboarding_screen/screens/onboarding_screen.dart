import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../data/item_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/onb_screen_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final OnbScreenController _controller = OnbScreenController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoPageScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe.builder(
            enableLoop: false,
            onPageChangeCallback: _controller.onPageChangeCallback,
            liquidController: _controller.controller,
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
          Obx(
            () => Positioned(
              bottom: size.height * 0.14,
              child: _controller.currentPage.value < (data.length - 1)
                  ? GestureDetector(
                      onTap: () {
                        _controller.skipAction(data.length);
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
                    )
                  : GestureDetector(
                      onTap: () {
                        _controller.logInButton();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.06,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Log In',
                              style: TextStyle(fontSize: 30),
                            ),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
          // : Positioned(
          // bottom: size.height * 0.14,
          // child:
          // Container(
          //   alignment: Alignment.center,
          //   height: size.height * 0.06,
          //   width: size.width * 0.3,
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black, width: 3),
          //     shape: BoxShape.rectangle,
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.white,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: const [
          //       Text(
          //         'Log In',
          //         style: TextStyle(fontSize: 30),
          //       ),
          //       Icon(
          //         CupertinoIcons.chevron_forward,
          //         color: Colors.black,
          //       )
          //     ],
          //   ),
          // ),
          // ),
          Obx(
            () => Positioned(
              bottom: size.height * 0.09,
              child: AnimatedSmoothIndicator(
                activeIndex: _controller.currentPage.value,
                count: data.length,
                effect: const ExpandingDotsEffect(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
