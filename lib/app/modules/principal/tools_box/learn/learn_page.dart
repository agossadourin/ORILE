import 'package:etourist/app/data/controllers/learn_controller.dart';
import 'package:etourist/app/modules/principal/tools_box/learn/second_learn_page.dart';
import 'package:etourist/app/modules/principal/tools_box/learn/widgets/learn_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LearnPage extends StatelessWidget {
  LearnPage({super.key});

  final LearnController learnController = Get.put(LearnController());

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              'Quelle langue voulez-vous apprendre à parler ?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.find<LearnController>().language.value = 0;
                  Get.to(() => const SecondLearnPage());
                },
                child: const LearnItem(title: 'Fon')),
            GestureDetector(
                onTap: () {
                  Get.find<LearnController>().language.value = 1;
                  Get.to(() => const SecondLearnPage());
                },
                child: const LearnItem(title: 'Yoruba')),
            GestureDetector(
                onTap: () {
                  Get.find<LearnController>().language.value = 2;
                  Get.to(() => const SecondLearnPage());
                },
                child: const LearnItem(title: 'Dendi')),
            GestureDetector(
                onTap: () {
                  Get.find<LearnController>().language.value = 3;
                  Get.to(() => SecondLearnPage());
                },
                child: const LearnItem(title: 'Adja')),
          ],
        ),
      ),
    );
  }
}
