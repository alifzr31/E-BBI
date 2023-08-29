import 'package:elearning/app/modules/dashboard/controller.dart';
import 'package:elearning/app/modules/dashboard/widgets/home.dart';
import 'package:elearning/app/modules/dashboard/widgets/my_lesson.dart';
import 'package:elearning/app/modules/dashboard/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyPage extends StatelessWidget {
  BodyPage({super.key});
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          HomeTab(),
          MyLessonTab(),
          ProfileTab(),
        ],
      ),
    );
  }
}
