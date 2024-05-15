import 'dart:async';
import 'package:etourist/app/modules/splash_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RxBool isFirstTime = true.obs;
  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    if (isFirstTime) {
      //no possibility to go bak to splash screen

      Get.off(() => const OnboardingScreen());
      await prefs.setBool('first_time', false);
    } else {
      Get.off(() => const OnboardingScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), () {
      //go to onboarding screen if first time, else go to register screen
      checkFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFF1F5F9)),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/image_1.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/icons/logo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
