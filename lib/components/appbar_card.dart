import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;

class CustomAppBarCard extends StatelessWidget {
  final Widget child;

  const CustomAppBarCard({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Container(
          width: size.width,
          height: size.height / 5,
          child: Center(
            child: Text(
              Constants.APP_LABEL,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
