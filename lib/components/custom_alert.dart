import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showAlert(BuildContext context, String title, String desc,
    Function leftOnPressed, Function rightOnPressed) {
  return Alert(
    context: context,
    type: AlertType.warning,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          "Delete",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: leftOnPressed,
        color: Styles.customDeclineButtonColor,
      ),
      DialogButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          "Cancel",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: rightOnPressed,
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();
}
