import 'package:etourist/app/modules/principal/tools_box/widgets/tool.dart';
import 'package:flutter/material.dart';

class ToolsBox extends StatelessWidget {
  const ToolsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Les outils pour faciliter vos',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Visites',
                  style: TextStyle(
                    color: Color(0xFF0B4D00),
                    fontSize: 47,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                Tool(
                  image: 'assets/images/logo.png',
                  title: 'Apprendre',
                ),
                Tool(
                  image: 'assets/images/logo.png',
                  title: 'Sous-titrage',
                ),
                Tool(
                  image: 'assets/images/logo.png',
                  title: 'Traducteur',
                ),
                Tool(
                  image: 'assets/images/logo.png',
                  title: 'Lang. signes',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
