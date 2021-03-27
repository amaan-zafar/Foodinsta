import 'package:flutter/material.dart';
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function onPressed;

  const CustomIconButton({Key key, this.icon, @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    return MaterialButton(
      minWidth: 0,
      // color: darkThemeProvider.darkTheme ? Styles.black2 : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      child: icon,
    );
  }
}
