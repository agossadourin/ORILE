import 'package:etourist/app/data/controllers/login_controller.dart';
import 'package:etourist/app/modules/principal/principal.dart';
import 'package:etourist/app/widgets/action_button.dart';
import 'package:etourist/app/widgets/my_form_field_bold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginWidget extends StatefulWidget {
  LoginWidget({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController? passwordController = TextEditingController();

  final TextEditingController? emailController = TextEditingController();

  bool isValidPasswordLength(String value, {required int length}) {
    return value.length >= length;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: LoginWidget._formKey,
        child: Column(
          children: [
            const Text(
              'Se connecter',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF020617),
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.09,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyFormFieldBold(
                leftIcon: 'email',
                controller: emailController,
                testInputType: TextInputType.visiblePassword,
                hintText: "email",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid data';
                  }
                  return null;
                },
                width: MediaQuery.of(context).size.width * 0.85,
                hasSepBar: false),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => MyFormFieldBold(
                  leftIcon: 'assets/icons/lock.png',
                  rightIcon:
                      Get.find<LoginController>().hidePassword.value == false
                          ? 'assets/icons/show.png'
                          : 'assets/icons/hide.png',
                  onTap: () {
                    if (Get.find<LoginController>().hidePassword.value ==
                        true) {
                      Get.find<LoginController>().hidePassword.value = false;
                    } else {
                      Get.find<LoginController>().hidePassword.value = true;
                    }
                  },
                  obscureText: Get.find<LoginController>().hidePassword.value,
                  controller: passwordController,
                  testInputType: TextInputType.text,
                  hintText: 'Mot de passe',
                  width: MediaQuery.of(context).size.width * 0.85,
                  hasSepBar: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
            ),
            const SizedBox(height: 15),
            // register text
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<LoginController>().isLogin.value = false;
                    },
                    child: SizedBox(
                      height: 25,
                      child: Text(
                        'S\'inscrire',
                        style: TextStyle(
                          color: const Color(0xFF020617).withOpacity(0.5),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0.09,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ActionButton(
                action: "S'inscrire",
                onPressed: () {
                  if (LoginWidget._formKey.currentState!.validate()) {
                    print('valid');
                    Get.to(() => Principal());
                  }
                })
          ],
        ),
      ),
    );
  }
}
