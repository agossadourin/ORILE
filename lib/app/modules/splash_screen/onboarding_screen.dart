import 'package:etourist/app/modules/register/login_page.dart';
import 'package:etourist/app/modules/splash_screen/page_1.dart';
import 'package:etourist/app/modules/splash_screen/page_3.dart';
import 'package:etourist/app/widgets/action_button.dart';
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
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    if (index == 2) {
                      _isLastPage.value = true;
                    } else {
                      _isLastPage.value = false;
                    }
                  },
                  children: [
                    Page1(),
                    Page2(),
                    Page3(),
                  ],
                ),
              ),
              Positioned(
                  top: 50,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: const SizedBox(
                      width: 60,
                      height: 30,
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFCAEAFF),
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              dotColor: Color(0xFFCAEAFF),
              activeDotColor: Color(0xFF0B4D00),
              dotHeight: 12,
              dotWidth: 12,
              expansionFactor: 3,
              spacing: 8,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() => ActionButton(
              action: _isLastPage.value == false ? 'Suivant' : 'Commencer',
              onPressed: () {
                _isLastPage.value
                    ? Get.to(const Login())
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
              }))
        ],
      ),
    );
  }
}
