import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_insta/controllers/login_controller.dart';
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/repository/auth_repo.dart';
import 'package:food_insta/screens/auth/login_screen.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:food_insta/controllers/location_controller.dart';

import 'models/dark_theme_provder.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  themeChangeProvider.darkTheme =
      await themeChangeProvider.darkThemePreference.getTheme();
  // Get a specific camera from the list of available cameras.
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final CustomHttpClient _customHttpClient =
      CustomHttpClient('foodinsta.herokuapp.com', Client(), _secureStorage);

  final AuthRepository authRepository =
      AuthRepository(_customHttpClient, _secureStorage);

  bool isloggedIn = !((await _secureStorage.read(key: 'access')) == null);

  runApp(
      MyApp(themeChangeProvider, isloggedIn, authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final DarkThemeProvider darkThemeProvider;
  final bool isLoggedIn;
  final AuthRepository authRepository;
  MyApp(this.darkThemeProvider, this.isLoggedIn, {this.authRepository});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => darkThemeProvider,
          ),
          ChangeNotifierProvider(
            create: (context) => LoginController(authRepository),
          ),
          ChangeNotifierProvider(
            create: (context) => LocationController(),
          ),
        ],
        child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
          return MaterialApp(
            title: Constants.APP_LABEL,
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(
                isDarkTheme: darkThemeProvider.darkTheme, context: context),
            home: isLoggedIn ? RootApp() : LoginPage(),
          );
        }));
  }
}
