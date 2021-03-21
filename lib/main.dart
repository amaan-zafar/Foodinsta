import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_post_card.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/home/home.dart';
import 'package:food_insta/screens/login.dart';
import 'package:food_insta/screens/registration/registeration_page.dart';
import 'package:food_insta/screens/registration/user_type.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
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
