import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_textfield.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;

class CustomAppCard extends StatelessWidget {
  final List<Widget> children;

  const CustomAppCard({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 54),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}
