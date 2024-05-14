import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //fill all the screen with the image
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/onboarding_2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),

        Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Des Récits\n Qui Inspirent l'Aventure",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF1B1E28),
                    fontSize: 23,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset('assets/icons/decorator.png'),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: const Text(
                      "Plongez dans l'histoire et la culture avec notre application immersive de découverte touristique.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7C838D),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
