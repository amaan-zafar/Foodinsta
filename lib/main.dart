import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/map_page.dart';
import 'package:food_insta/screens/auth/login.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  runApp(MyApp(firstCamera));
}

class MyApp extends StatelessWidget {
  bool isLoggedIn = false;
  final CameraDescription camera;

  MyApp(this.camera);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserNotifier())],
      child: MaterialApp(
        title: Constants.APP_LABEL,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(),
        home: isLoggedIn ? MapWidget() : LoginPage(),
      ),
    );
  }
}