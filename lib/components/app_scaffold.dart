import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart' as AppTheme;

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
          color: AppTheme.whiteBgScreenColor,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 4.5,
                      decoration: BoxDecoration(
                          gradient: AppTheme.bgLinearGradient,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16))),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(12, size.height / 6, 12, 0),
                      child: child,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  width: size.width,
                  height: 100,
                  child: Align(
                    alignment: Alignment(0, 0.4),
                    child: Text(
                      Constants.APP_LABEL,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: AppTheme.bgLinearGradient,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
