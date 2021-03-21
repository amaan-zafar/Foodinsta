import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextStyle style;
  final void Function(String) onChanged;
  CustomTextField(
      {this.labelText,
      this.keyboardType,
      this.controller,
      this.validator,
      this.style,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      onChanged: onChanged,
      style: style,
      validator: validator,
    ));
  }
}
