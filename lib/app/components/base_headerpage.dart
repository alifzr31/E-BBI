import 'package:elearning/app/components/base_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaseHeaderPage extends StatelessWidget {
  const BaseHeaderPage({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title,
                    size: 16,
                    color: Colors.white,
                    bold: FontWeight.bold,
                  ),
                  BaseText(
                    text: subtitle,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BaseHeaderActionPage extends StatelessWidget {
  const BaseHeaderActionPage({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.actionWidget,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Widget actionWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 50,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: title,
                    size: 16,
                    color: Colors.white,
                    bold: FontWeight.bold,
                  ),
                  BaseText(
                    text: subtitle,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
            actionWidget,
          ],
        ),
      ),
    );
  }
}
