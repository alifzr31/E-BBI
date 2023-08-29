import 'package:flutter/material.dart';
// import 'package:member_apps/app/core/value.dart';

class BaseTextArea extends StatelessWidget {
  const BaseTextArea({
    Key? key,
    this.controller,
    required this.label,
    this.maxLines,
    this.validator,
    this.enabled = true,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String label;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      enabled: enabled,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
