import 'package:flutter/material.dart';
import 'package:etourist/app/core/utils/extensions.dart';

//stateless widget
class SecondActionButton extends StatelessWidget {
  final String? action;
  final VoidCallback? onPressed;
  //constructor
  const SecondActionButton(
      {Key? key, required this.action, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //button container
      height: 6.0.hp,
      width: 85.0.wp,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      //button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0x0D000000),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          action!,
          style: TextStyle(
              color: Color(0xFF0B4D00),
              fontFamily: 'Imprima',
              fontSize: 2.0.hp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
