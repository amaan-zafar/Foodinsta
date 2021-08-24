import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;
  final bool centerTitle;
  final String title;

  const CustomAppBar(
      {Key key, this.actions, this.centerTitle = false, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: centerTitle
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title == null ? Constants.APP_LABEL : title,
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
