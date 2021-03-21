import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String textOnButton;

  CustomButton({this.textOnButton, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            height: 64,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            onPressed: onPressed,
            child: Text(textOnButton, style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
