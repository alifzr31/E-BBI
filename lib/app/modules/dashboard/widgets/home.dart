import 'package:elearning/app/core/values/colors.dart';
import 'package:elearning/app/modules/dashboard/components/home/body_home.dart';
import 'package:elearning/app/modules/dashboard/components/home/header_home.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Column(
        children: [
          HeaderHome(),
          BodyHome(),
        ],
      ),
    );
  }
}
