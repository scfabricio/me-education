import 'package:flutter/material.dart';

class MyEditText extends StatelessWidget {
  final String label;
  final TextInputType inputType;
  final String value;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  const MyEditText({
    super.key, 
    required this.label,
    required this.inputType, 
    required this.value,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value.toString(),
      validator: validator,
      onChanged: onChanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}