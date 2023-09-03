import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class BaseDateTimePicker extends StatelessWidget {
  const BaseDateTimePicker({
    Key? key,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.label,
    this.initialValue,
    this.selectableDayPredicate,
    this.firstDate,
    this.lastDate,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? Function(Object?)? validator;
  final String? label;
  final String? initialValue;
  final bool Function(DateTime)? selectableDayPredicate;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return DateTimePicker(
      initialValue: initialValue,
      controller: controller,
      decoration: InputDecoration(labelText: label),
      type: DateTimePickerType.dateTime,
      firstDate: firstDate == null ? DateTime(2023) : firstDate,
      lastDate: lastDate == null ? DateTime(2024) : lastDate,
      onChanged: onChanged,
      validator: validator,
      selectableDayPredicate: selectableDayPredicate,
      onSaved: onSaved,
    );
  }
}
