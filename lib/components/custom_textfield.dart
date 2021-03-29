import 'package:flutter/material.dart';
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String Function(String) validator;
  final TextStyle style;
  final int minLines;
  final int maxLines;
  final void Function(String) onChanged;
  final void Function(String) onSaved;
  final bool enabled;
  CustomTextField({
    this.hintText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.style,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
    this.onSaved,
    this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: darkThemeProvider.darkTheme
              ? Styles.black2
              : Styles.textFieldColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 4, 0, 4),
            child: TextFormField(
              onSaved: onSaved,
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
                  errorStyle: TextStyle(fontSize: 13),
                  // contentPadding: const EdgeInsets.fromLTRB(18, 16, 0, 16),
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyText1),
              onChanged: onChanged,
              style: style,
              validator: validator,
            ),
          )),
    );
  }
}
