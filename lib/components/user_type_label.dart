import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class UserTypeLabel extends StatelessWidget {
  final String label;

  const UserTypeLabel({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(64), right: Radius.circular(64)),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 14),
          ),
        ),
        color: AppTheme.customApprovedButtonColor,
      ),
    );
  }
}
