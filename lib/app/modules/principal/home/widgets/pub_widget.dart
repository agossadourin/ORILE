import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:etourist/app/data/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PubWidget extends StatelessWidget {
  PubWidget({super.key});

  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.2,
          child: CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  Get.find<HomePageController>().dotsIndicatorIndex.value =
                      index;
                },
                viewportFraction: 1,
                height: 400.0,
                autoPlay: true),
            items: [
              'assets/images/pub1.jpeg',
              'assets/images/pub2.jpg',
              'assets/images/pub3.jpg',
              'assets/images/pub4.jpeg',
              'assets/images/pub3.jpg'
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 155, 145, 145),
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(i),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Obx(
          () => DotsIndicator(
              dotsCount: 5,
              position: Get.find<HomePageController>().dotsIndicatorIndex.value,
              decorator: const DotsDecorator(
                color: Colors.grey,
                activeColor: Colors.blue,
              )),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
