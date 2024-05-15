import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Tool extends StatelessWidget {
  final String? image;
  final String? title;
  const Tool({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: const Color(0xFF0B4D00),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: AssetImage(image!),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.025,
            ),
            Center(
              child: Text(
                title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
