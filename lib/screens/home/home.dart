import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.APP_LABEL),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
