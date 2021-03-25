import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final bool centerTitle;

  const CustomAppBar({Key key, this.actions, this.centerTitle = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: centerTitle
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Constants.APP_LABEL,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.white),
            ),
            actions != null
                ? Row(
                    children: actions,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
