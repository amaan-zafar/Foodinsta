import 'package:flutter/cupertino.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return null;
      case 'register':
        return null;

      case '/register-ngo':
        return null;

      case 'register-restaurant':
        return null;

      case '/register-individual':
        return null;
    }
  }
}
