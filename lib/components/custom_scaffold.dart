import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;

  const CustomScaffold({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Styles.whiteBgScreenColor,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height / 4,
                decoration: BoxDecoration(
                    gradient: Styles.bgLinearGradient,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16))),
                child: Align(
                  alignment: Alignment(0, 0),
                  child: Text(
                    Constants.APP_LABEL,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
