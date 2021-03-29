import 'package:flutter/material.dart';
import 'package:food_insta/repository/registration_repo.dart';
import 'package:food_insta/components/custom_label.dart';
import 'package:food_insta/theme.dart';

class UserTypeLabel extends StatelessWidget {
  final String label;
  final USERTYPE usertype;
  final double fontSize;
  final double horizontalPadding;
  const UserTypeLabel(
      {Key key,
      this.label,
      this.usertype,
      this.fontSize = 14,
      this.horizontalPadding = 18})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomLabel(
      color: Styles.customApprovedButtonColor,
      label: label,
      fontSize: fontSize,
      horizontalPadding: horizontalPadding,
    );
  }
}
