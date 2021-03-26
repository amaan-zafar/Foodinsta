import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart';

class CustomTextButton extends StatelessWidget {
  final Function onPressed;
  final String textOnButton;
  final Color color;

  CustomTextButton({
    this.textOnButton,
    this.onPressed,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: MaterialButton(
        height: 56,
        minWidth: 0,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: onPressed,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textOnButton,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
