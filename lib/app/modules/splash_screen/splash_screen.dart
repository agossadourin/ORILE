import 'dart:async';
import 'package:etourist/app/modules/register/register_page.dart';
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
      Get.off(() => const Register());
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      //go to onboarding screen if first time, else go to register screen
      checkFirstTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00DBB7),
              Color(0xFF081715),
            ],
          ),
        ),
        // other properties of the container
        child: Center(
          //logo here
          child: Image.asset(
              'assets/images/logo.png'), // replace with your logo path
        ));
  }
}
