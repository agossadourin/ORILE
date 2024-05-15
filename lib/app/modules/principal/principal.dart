import 'package:etourist/app/data/controllers/principal_controller.dart';
import 'package:etourist/app/modules/principal/home/home.dart';
import 'package:etourist/app/modules/principal/image_descriptor/image_descriptor_page.dart';
import 'package:etourist/app/modules/principal/shorts/shorts_page.dart';
import 'package:etourist/app/modules/principal/tools_box/tools_box_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Principal extends StatelessWidget {
  Principal({super.key});
  final PageController _pageController = PageController();

  static List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/Home.png'),
      ),
      label: 'Acceuil',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/Calendar.png'),
      ),
      label: 'Appre',
    ),
    BottomNavigationBarItem(
        icon: Container(
          width: 40.0,
          height: 40.0,
          decoration: const BoxDecoration(
            color: Color(0xFF0B4D00),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              'Quiz',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
              ),
            ),
          ),
        ),
        label: ''),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/Caht.png'),
      ),
      label: 'Visiter',
    ),
    const BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/Portraits.png'),
      ),
      label: 'Outils',
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
        backgroundColor: const Color(0xFFF8FAFC),
        resizeToAvoidBottomInset: false,
        //add background image
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        Get.find<PrincipalController>().currentPage.value =
                            index;
                        index;
                      },
                      children: [
                        Home(),
                        VideoScreen(),
                        ImageDescriptorPage(),
                        const Center(
                          child: Text('roadtrip'),
                        ),
                        const ToolsBox()
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            items: items,
            onTap: onButtonPressed,
            currentIndex: Get.find<PrincipalController>().currentPage.value,
            backgroundColor: Colors.white12,
            selectedItemColor: const Color(0xFF0B4D00),
            unselectedItemColor: const Color(0xFF7C838D),
            showUnselectedLabels: true,
          ),
        ));
  }
}
