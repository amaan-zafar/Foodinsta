import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  const CustomIconButton({Key key, this.icon, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () {},
      child: icon,
    );
  }
}
