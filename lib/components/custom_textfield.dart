import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextStyle style;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  CustomTextField(
      {this.hintText,
      this.keyboardType,
      this.controller,
      this.validator,
      this.style,
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Styles.textFieldColor,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            minLines: minLines,
            maxLines: maxLines,
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
          )),
    );
  }
}
