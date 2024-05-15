import 'package:flutter/material.dart';
import 'package:etourist/app/modules/principal/trips/trip_two.dart';

class TripOnePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TripTwoPage()),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/tripOne.png'),
        ),
      ),
    );
  }
}
