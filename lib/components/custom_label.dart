import 'package:flutter/material.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  final Color color;
  final double fontSize;
  final double horizontalPadding;
  const CustomLabel(
      {Key key,
      this.label,
      this.color,
      this.fontSize = 14,
      this.horizontalPadding = 18})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(64), right: Radius.circular(64)),
      child: Container(
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 8, horizontal: horizontalPadding),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontSize: fontSize, color: Colors.white),
          ),
        ),
        color: color,
      ),
    );
  }
}
