import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/controllers/login_controller.dart';
import 'package:food_insta/screens/auth/login_screen.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              // AppBar
              CustomAppBar(
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Styles.iconColor,
                    ),
                  )
                ],
              ),

              // Body
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18),
                  children: [
                    CustomAppCard(
                      children: [
                        Text(
                          'About ${Constants.APP_LABEL}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Erat ut et, massa est in. Viverra enim commodo semper lectus. Molestie viverra metus lorem lobortis viverra. Sed feugiat nullam lectus scelerisque blandit eleifend.'),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Dark mode'),
                          trailing: Switch(
                            activeColor: Styles.iconColor,
                            onChanged: (bool value) {
                              setState(() {
                                themeChange.darkTheme = value;
                              });
                            },
                            value: themeChange.darkTheme,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Rate App'),
                          trailing: IconButton(
                            icon: Icon(Icons.open_in_new),
                            color: Styles.iconColor,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Privacy Policy'),
                          trailing: IconButton(
                            icon: Icon(Icons.open_in_new),
                            color: Styles.iconColor,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Terms and conditions'),
                          trailing: IconButton(
                            icon: Icon(Icons.open_in_new),
                            color: Styles.iconColor,
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Sign out'),
                          trailing: IconButton(
                            icon: Icon(MdiIcons.logout),
                            color: Styles.iconColor,
                            onPressed: () async {
                              var controller = Provider.of<LoginController>(
                                  context,
                                  listen: false);
                              await controller.logOut().whenComplete(() =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()),
                                      (Route<dynamic> route) => false));
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
