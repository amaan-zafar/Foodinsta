import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextStyle style;
  final void Function(String) onChanged;
  CustomTextField(
      {this.hintText,
      this.keyboardType,
      this.controller,
      this.validator,
      this.style,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppTheme.textFieldColor,
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(18, 16, 0, 16),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1),
          onChanged: onChanged,
          style: style,
          validator: validator,
        ));
  }
}
