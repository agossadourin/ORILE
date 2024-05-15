import 'package:etourist/app/modules/principal/trips/trip_one.dart';
import 'package:flutter/material.dart';

class TripThreePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TripOnePage()),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/tripThree.png'),
        ),
      ),
    );
  }
}
