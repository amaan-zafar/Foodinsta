import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final icon;
  final Function onPressed;
  final double elevation;
  final double height;
  final Color color;

  const CustomIconButton(
      {Key key,
      this.icon,
      @required this.onPressed,
      this.elevation,
      this.height = 46,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 62,
      child: Card(
        color: color,
        elevation: elevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: MaterialButton(
          minWidth: 0,
          elevation: elevation,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onPressed: onPressed,
          child: icon,
        ),
      ),
    );
  }
}
