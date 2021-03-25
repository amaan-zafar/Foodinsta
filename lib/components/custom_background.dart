import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';

class CustomBackground extends StatelessWidget {
  final Widget child;

  const CustomBackground({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).padding.top;

    return Container(
      width: width,
      height: height,
      color: Styles.whiteBgScreenColor,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: width,
              height: height / 4,
              decoration: BoxDecoration(
                  gradient: Styles.bgLinearGradient,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
            ),
            Container(
              width: double.infinity,
              height: topPadding + 74,
              decoration: BoxDecoration(gradient: Styles.bgLinearGradient),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(12, height / 6, 12, 0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
