import 'package:etourist/app/modules/principal/tools_box/learn/widgets/third_learn_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controllers/learn_controller.dart';

class ThirdLearnPage extends StatelessWidget {
  const ThirdLearnPage({super.key});

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
            child: Column(
              children: [
                Text(
                  Get.find<LearnController>()
                      .languageList
                      .value[Get.find<LearnController>().language.value],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF0B4D00),
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'Salutations',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ThirdLearnItem(
              translatedValue: Get.find<LearnController>()
                  .translatedValues
                  .value[Get.find<LearnController>().language.value],
              image: 'assets/images/salutations.png',
              value: 'Bonsoir',
              translateTo: Get.find<LearnController>().language.value),
          ThirdLearnItem(
              translatedValue: Get.find<LearnController>()
                  .translatedValues
                  .value[Get.find<LearnController>().language.value + 1],
              image: 'assets/images/good.jpeg',
              value: 'Très bien',
              translateTo: Get.find<LearnController>().language.value)
        ],
      ),
    );
  }
}
