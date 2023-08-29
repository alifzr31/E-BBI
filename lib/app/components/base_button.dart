import 'package:elearning/app/components/base_text.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.bgColor,
    this.fgColor,
  }) : super(key: key);

  final String label;
  final void Function()? onPressed;
  final Color? bgColor;
  final Color? fgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
      ),
      onPressed: onPressed,
      child: BaseText(text: label),
    );
  }
}