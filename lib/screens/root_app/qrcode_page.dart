import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;

class QRCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        SizedBox(
          height: 74,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  Constants.APP_LABEL,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white),
                ),
                Spacer(),
                SizedBox(width: 10),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back,
                    color: Styles.iconColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
