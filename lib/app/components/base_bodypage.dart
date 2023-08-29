import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseBodyPage extends StatelessWidget {
  const BaseBodyPage({
    Key? key,
    required this.child
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFBFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: child,
      ),
    );
  }
}
