import 'package:flutter/material.dart';
import 'package:etourist/app/core/utils/extensions.dart';

class MyFormFieldBold extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? testInputType;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final double? width;
  final String? leftIcon;
  final String? rightIcon;
  final bool? obscureText;
  final bool? hasSepBar;
  const MyFormFieldBold(
      {super.key,
      required this.controller,
      required this.testInputType,
      required this.hintText,
      required this.validator,
      required this.width,
      this.leftIcon,
      this.rightIcon,
      this.obscureText,
      this.onTap,
      required this.hasSepBar});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.hp,
      width: width,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 215, 215, 240),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          if (leftIcon != null)
            Positioned(
                left: 0,
                top: 1.125.hp,
                child: Container(
                  width: 20,
                  height: 20,
                  child: Icon(
                    leftIcon == 'person'
                        ? Icons.person
                        : leftIcon == 'email'
                            ? Icons.mail
                            : Icons.lock,
                    color: Colors.black,
                    size: 20,
                  ),
                )),
          // mini vertical bar
          if (hasSepBar!)
            Positioned(
              left: 3.5.hp,
              top: 1.125.hp,
              child: Container(
                width: 1,
                height: 3.0.hp,
                color: const Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ),
          TextFormField(
            controller: controller,
            keyboardType: testInputType,
            obscureText: obscureText ?? false,
            validator: validator,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: hasSepBar! ? 40 : 30, bottom: 5),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                    fontFamily: 'Imprima',
                    fontSize: 2.0.hp,
                    fontWeight: FontWeight.w400)),
          ),
          if (rightIcon != null)
            Positioned(
                left: 0.80 * width!,
                top: 1.5.hp,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(rightIcon!),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Icon(Icons.remove_red_eye,
                        color: Colors.black, size: 18),
                  ),
                )),
        ],
      ),
    );
  }
}
