import 'package:etourist/app/data/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterItem extends StatelessWidget {
  final String? iconVal;
  final String? text;
  final int? index;
  const FilterItem(
      {super.key,
      required this.iconVal,
      required this.text,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.find<HomePageController>().filterIndex.value = index!;
        },
        child: Obx(
          () => Container(
            height: 30.39,
            margin: const EdgeInsets.only(right: 10),
            padding:
                const EdgeInsets.only(top: 8, left: 6, right: 10, bottom: 8),
            decoration: ShapeDecoration(
              color: Get.find<HomePageController>().filterIndex.value == index!
                  ? const Color(0xFF0B4D00)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFF0B4D00),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(iconVal!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  text!,
                  style: TextStyle(
                    color: Get.find<HomePageController>().filterIndex.value ==
                            index!
                        ? Colors.white
                        : Colors.black,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
