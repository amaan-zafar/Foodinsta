import 'package:flutter/material.dart';
import 'package:food_insta/screens/root_app/qr_code/scan_success.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((_) => Navigator.of(context)
        .pushReplacement(
            MaterialPageRoute(builder: (_) => ScanSuccessScreen())));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 102, 255),
      body: Center(
        child: Container(
          width: 230,
          child: Center(
              child: RiveAnimation.asset(
            'assets/animation.riv',
          )),
        ),
      ),
    );
  }
}
