import 'package:flutter/material.dart';

class LearnItem extends StatelessWidget {
  final String? title;
  const LearnItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.2,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xD9D9D980),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 0.02,
            ),
          ),
        ));
  }
}
