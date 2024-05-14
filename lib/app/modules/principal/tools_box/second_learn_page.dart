import 'package:etourist/app/modules/principal/tools_box/third_learn_page.dart';
import 'package:etourist/app/modules/principal/tools_box/widgets/second_learn_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/controllers/learn_controller.dart';

class SecondLearnPage extends StatelessWidget {
  const SecondLearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x0B4D000D),
        title: const Text(
          'Apprendre',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0.09,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            color: const Color(0x0B4D000D),
            child: Center(
              child: Text(
                Get.find<LearnController>()
                    .languageList
                    .value[Get.find<LearnController>().language.value],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0B4D00),
                  fontSize: 38,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Get.find<LearnController>().subject.value = 0;
              Get.to(() => const ThirdLearnPage());
            },
            child: const SecondLearnItem(
                image: 'assets/images/salutations.png', title: 'Salutations'),
          ),
          GestureDetector(
            onTap: () {
              Get.find<LearnController>().subject.value = 1;
              Get.to(() => const ThirdLearnPage());
            },
            child: const SecondLearnItem(
                image: 'assets/images/nombres.png', title: 'Nombres'),
          ),
          GestureDetector(
            onTap: () {
              Get.find<LearnController>().subject.value = 2;
              Get.to(() => const ThirdLearnPage());
            },
            child: const SecondLearnItem(
                image: 'assets/images/salutations.png', title: 'Au marché'),
          ),
        ],
      ),
    );
  }
}
