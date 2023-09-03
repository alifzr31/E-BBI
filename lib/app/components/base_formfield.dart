import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseFormField extends StatelessWidget {
  const BaseFormField({
    Key? key,
    this.label,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
    );
  }
}