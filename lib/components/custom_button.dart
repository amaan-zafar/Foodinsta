import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String textOnButton;
  final Color color;
  final Icon icon;

  CustomButton(
      {this.textOnButton,
      this.onPressed,
      this.color = AppTheme.iconColor,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 56,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon == null ? Container() : icon,
          Text(
            textOnButton,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
