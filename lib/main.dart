import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/home/home.dart';
import 'package:food_insta/screens/login.dart';
import 'package:food_insta/screens/registration/registeration_page.dart';
import 'package:food_insta/screens/registration/user_type.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'FoodEx',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoggedIn ? Home() : Login(),
      ),
    );
  }
}
