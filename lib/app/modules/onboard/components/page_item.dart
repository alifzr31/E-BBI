import 'package:elearning/app/components/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PageItem extends StatelessWidget {
  const PageItem({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: SvgPicture.asset(
                image,
                width: 350,
              ),
            ),
          ),
        ),
        Container(
          color: const Color(0xFFFAFAFA),
          height: 300,
          width: Get.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                text: title,
                size: 22,
                bold: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              BaseText(
                text: subtitle,
                size: 16,
                color: Colors.grey.shade600,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
