import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/onboard/components/page_item.dart';
import 'package:elearning/app/modules/onboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageBuilder extends StatelessWidget {
  PageBuilder({super.key});
  final controller = Get.put(OnBoardcontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          PageView.builder(
            controller: controller.pageController.value,
            onPageChanged: (value) {
              controller.currentPage.value = value;
            },
            itemCount: controller.images.length,
            itemBuilder: (context, index) {
              return PageItem(
                image: controller.images[index],
                title: controller.titles[index],
                subtitle: controller.subtitles[index],
              );
            },
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      controller.images.length,
                      (index) => Container(
                        width: controller.currentPage.value == index ? 13 : 10,
                        height: controller.currentPage.value == index ? 13 : 10,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: controller.currentPage.value == index
                              ? baseColor
                              : softPurple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: controller.currentPage.value ==
                            (controller.images.length - 1)
                        ? 140
                        : 70,
                    height: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: softPurple,
                        foregroundColor: baseColor,
                        shape: controller.currentPage.value ==
                                (controller.images.length - 1)
                            ? const StadiumBorder()
                            : const CircleBorder(),
                      ),
                      onPressed: () async {
                        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                        
                        if (controller.currentPage.value ==
                            (controller.images.length - 1)) {
                          sharedPreferences.setBool('isOpened', true);
                          Get.offAllNamed('/auth');
                        } else {
                          controller.nextPage();
                        }
                      },
                      child: controller.currentPage.value ==
                              (controller.images.length - 1)
                          ? const Text(
                              'Get Started',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
