import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/map_screen.dart';
import 'package:food_insta/screens/auth/login_screen.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
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

class MyApp extends StatefulWidget {
  final CameraDescription camera;

  MyApp(this.camera);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = true;
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeChangeProvider,
        ),
      ],
      child: MaterialApp(
        title: Constants.APP_LABEL,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(),
        home: isLoggedIn ? RootApp() : LoginPage(),
      ),
    );
  }
}
