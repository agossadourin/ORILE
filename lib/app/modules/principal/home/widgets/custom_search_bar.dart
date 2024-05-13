import 'package:etourist/app/core/utils/extensions.dart';
import 'package:etourist/app/widgets/my_form_field_bold.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.controller,
    required this.testInputType,
    required this.hintText,
    required this.validator,
    required this.width,
    this.leftIcon,
    this.rightIcon,
    this.obscureText,
    this.onTap,
  });
  final TextEditingController? controller;
  final TextInputType? testInputType;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final double? width;
  final String? leftIcon;
  final String? rightIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.hp,
      width: width,
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.only(left: 15, bottom: 5),
      decoration: BoxDecoration(
        color: Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 1.125.hp,
            child: Container(
              width: 20,
              height: 20,
              child: Icon(Icons.search),
            ),
          ),
          // mini vertical bar
          TextFormField(
            controller: controller,
            keyboardType: testInputType,
            obscureText: obscureText ?? false,
            validator: validator,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 30, bottom: 5),
                hintText: hintText,
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                    fontFamily: 'Imprima',
                    fontSize: 2.0.hp,
                    fontWeight: FontWeight.w400)),
          ),

          Positioned(
            left: 0.80 * width!,
            top: 1.5.hp,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/microphone.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
