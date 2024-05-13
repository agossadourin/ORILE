import 'package:etourist/app/modules/principal/home/widgets/key_info_item.dart';
import 'package:flutter/material.dart';

import '../../../data/models/place.dart';

class PlaceDetails extends StatelessWidget {
  final Place? place;
  const PlaceDetails({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/place_1.png"),
                  fit: BoxFit.fitHeight,
                ),
                shape: RoundedRectangleBorder(),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                        weight: 10,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 20,
                    child: Opacity(
                      opacity: 0.20,
                      child: Container(
                        width: 37.12,
                        height: 37.12,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF1B1E28),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 15,
                    child: IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Text(
                  place!.name,
                  style: const TextStyle(
                    color: Color(0xFF0A2753),
                    fontSize: 28,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.05,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.heart_broken,
                      color: Color(0xff0B4D00),
                    )),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/icons/Pin.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  place!.location,
                  style: const TextStyle(
                    color: Color(0xFF0A2753),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyInfoItem(
                    title: "Notes",
                    subtitle: "4.8(3.2k)",
                    icon: "assets/icons/Iconrating.png"),
                KeyInfoItem(
                    title: "Distance",
                    subtitle: "326Km",
                    icon: "assets/icons/Icontrip.png"),
                KeyInfoItem(
                    title: "Langue",
                    subtitle: "Fon",
                    icon: "assets/icons/Icontrip.png"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
