import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/screens/auth/registeration_screen.dart';
import 'package:food_insta/screens/auth/user_type_screen.dart';
import 'package:food_insta/screens/root_app/root_app.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => RootApp());
      case '/user-type-screen':
        return MaterialPageRoute(builder: (_) => UserTypePage());

      case '/registeration':
        return MaterialPageRoute(builder: (_) => RegistrationForm());

      case '/root-app':
        return MaterialPageRoute(builder: (_) => RootApp());
    }
  }
}
