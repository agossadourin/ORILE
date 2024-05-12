import 'package:etourist/app/data/controllers/login_controller.dart';
import 'package:etourist/app/modules/register/widgets/login_widget.dart';
import 'package:etourist/app/modules/register/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              Obx(
                () => Get.find<LoginController>().isLogin.value == false
                    ? RegisterWidget()
                    : LoginWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
