import 'package:etourist/app/modules/register/login_page.dart';
import 'package:etourist/app/modules/splash_screen/page_1.dart';
import 'package:etourist/app/modules/splash_screen/page_3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'page_2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  //isLastPage controller
  final RxBool _isLastPage = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              if (index == 2) {
                _isLastPage.value = true;
              } else {
                _isLastPage.value = false;
              }
            },
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    'Passer',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.white,
                    dotHeight: 12,
                    dotWidth: 12,
                    expansionFactor: 3,
                    spacing: 8,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _isLastPage.value
                        ? Get.to(const Login())
                        : _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                  },
                  child: Obx(() => _isLastPage.value
                      ? const Text(
                          'Commencer',
                          style: TextStyle(color: Colors.white),
                        )
                      : const Text(
                          'suivant',
                          style: TextStyle(color: Colors.white),
                        )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
