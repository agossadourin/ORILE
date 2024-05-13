import 'package:flutter/material.dart';

class KeyInfoItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? icon;
  const KeyInfoItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(icon!),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: TextStyle(
                  color: Color(0xFF69778A),
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  height: 0.14,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                subtitle!,
                style: TextStyle(
                  color: Color(0xFF0A2753),
                  fontSize: 12,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
