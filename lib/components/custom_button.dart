import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String textOnButton;
  final Color color;
  final Icon icon;

  CustomButton(
      {this.textOnButton, this.onPressed, this.color = Colors.blue, this.icon});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 56,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      child: Text(
        textOnButton,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
