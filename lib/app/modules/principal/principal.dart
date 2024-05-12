import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:etourist/app/data/controllers/principal_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

// ignore: must_be_immutable
class Principal extends StatelessWidget {
  Principal({super.key});
  final PageController _pageController = PageController();

  static const List<TabItem> items = [
    TabItem(
      icon: Icons.home_rounded,
      title: 'Acceuil',
    ),
    TabItem(
      icon: Icons.search_rounded,
      title: 'Rechercher',
    ),
    TabItem(
      icon: Icons.add,
      title: 'add',
    ),
    TabItem(
      icon: Icons.list,
      title: 'Mon espace',
    ),
    TabItem(
      icon: Icons.help_center,
      title: 'Support',
    ),
  ];

  void onButtonPressed(int index) {
    Get.find<PrincipalController>().currentPage.value = index;
    _pageController.animateToPage(
        Get.find<PrincipalController>().currentPage.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //add background image
      body: Stack(
        children: [
          Container(
              /*decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/welcome_bg_img.png"), // replace with your image path
                  fit: BoxFit.cover,
                ),
              ),*/
              ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      Get.find<PrincipalController>().currentPage.value = index;
                      index;
                    },
                    children: [
                      const Center(
                        child: Text('home'),
                      ),
                      const Center(
                        child: Text('Road trips'),
                      ),
                      const Center(
                        child: Text('Tools box'),
                      ),
                      const Center(
                        child: Text('Profile'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomBarCreative(
            items: items,
            backgroundColor: Colors.white,
            color: Color(0xFF7C838D),
            colorSelected: Color(0xFF0B4D00),
            indexSelected: Get.find<PrincipalController>().currentPage.value,
            onTap: (int index) {
              Get.find<PrincipalController>().currentPage.value = index;
            }),
      ),
    );
  }
}
