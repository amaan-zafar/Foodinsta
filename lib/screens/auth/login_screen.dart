import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_scaffold.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/screens/auth/user_type_screen.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool userAuthorised = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  centerTitle: true,
                ),
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(12, Styles.cardTopPadding, 12, 0),
                  child: CustomAppCard(
                    children: [
                      Container(
                        height: 54,
                        child: Center(
                          child: Text(
                            'Log in to your account',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ),
                      MaterialButton(
                        height: 56,
                        elevation: 0,
                        color: Styles.buttonColor1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UserTypePage()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MdiIcons.google,
                              color: Colors.white,
                            ),
                            SizedBox(width: 16),
                            Text(
                              'Sign in with Google',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: Image(
                          image: AssetImage('assets/login_img.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
