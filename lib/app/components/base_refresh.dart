import 'package:elearning/app/core/values/colors.dart';
import 'package:flutter/material.dart';

class BaseRefresh extends StatelessWidget {
  const BaseRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: baseColor,
      color: Colors.white,
      onRefresh: onRefresh,
      child: child,
    );
  }
}