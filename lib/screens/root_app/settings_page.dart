import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              // AppBar
              SizedBox(
                height: 74,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Text(
                        Constants.APP_LABEL,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      CustomIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppTheme.iconColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Body
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 18),
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
                    SizedBox(height: 18),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Dark mode'),
                          trailing: Switch(
                            activeColor: AppTheme.iconColor,
                            onChanged: (bool value) {
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            },
                            value: isDarkMode,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Rate App'),
                          trailing: IconButton(
                            icon: Icon(Icons.rate_review),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Privacy Policy'),
                          trailing: IconButton(
                            icon: Icon(Icons.rate_review),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    CustomAppCard(
                      width: double.infinity,
                      children: [
                        ListTile(
                          title: Text('Terms and conditions'),
                          trailing: IconButton(
                            icon: Icon(Icons.rate_review),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18),
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
