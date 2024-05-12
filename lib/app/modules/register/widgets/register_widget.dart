import 'package:etourist/app/data/controllers/login_controller.dart';
import 'package:etourist/app/modules/principal/principal.dart';
import 'package:etourist/app/widgets/action_button.dart';
import 'package:etourist/app/widgets/my_form_field_bold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterWidget extends StatelessWidget {
  RegisterWidget({super.key});

  final TextEditingController? passwordController = TextEditingController();
  final TextEditingController? emailController = TextEditingController();
  final TextEditingController? surnameController = TextEditingController();
  final TextEditingController? firstNameController = TextEditingController();
  final TextEditingController? confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isValidPasswordLength(String value, {required int length}) {
    return value.length >= length;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Sign up',
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
                controller: surnameController,
                testInputType: TextInputType.visiblePassword,
                hintText: "Nom",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid name';
                  }
                  return null;
                },
                width: MediaQuery.of(context).size.width * 0.85,
                hasSepBar: false),
            const SizedBox(
              height: 20,
            ),
            MyFormFieldBold(
                controller: firstNameController,
                testInputType: TextInputType.visiblePassword,
                hintText: "Prénoms",
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
            Obx(
              () => MyFormFieldBold(
                  leftIcon: 'assets/icons/lock.png',
                  rightIcon:
                      Get.find<LoginController>().hidePassword2.value == false
                          ? 'assets/icons/show.png'
                          : 'assets/icons/hide.png',
                  onTap: () {
                    if (Get.find<LoginController>().hidePassword2.value ==
                        true) {
                      Get.find<LoginController>().hidePassword2.value = false;
                    } else {
                      Get.find<LoginController>().hidePassword2.value = true;
                    }
                  },
                  obscureText: Get.find<LoginController>().hidePassword2.value,
                  controller: confirmPasswordController,
                  testInputType: TextInputType.visiblePassword,
                  hintText: 'Confirmer le mot de...',
                  width: MediaQuery.of(context).size.width * 0.85,
                  hasSepBar: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  }),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<LoginController>().isLogin.value = true;
                    },
                    child: SizedBox(
                      height: 25,
                      child: Text(
                        'Se Connecter',
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
                action: "S\'inscrire",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
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
