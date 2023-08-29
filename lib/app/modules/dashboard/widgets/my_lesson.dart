import 'package:elearning/app/modules/dashboard/components/my_lesson/body_mylesson.dart';
import 'package:elearning/app/modules/dashboard/components/my_lesson/header_mylesson.dart';
import 'package:flutter/material.dart';

class MyLessonTab extends StatelessWidget {
  const MyLessonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderMyLesson(),
            BodyMyLesson(),
          ],
        ),
      ),
    );
  }
}
