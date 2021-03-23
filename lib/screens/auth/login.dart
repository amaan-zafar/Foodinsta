import 'package:flutter/material.dart';
import 'package:food_insta/components/app_scaffold.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/screens/auth/user_type.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool userAuthorised = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppScaffold(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64),
        child: CustomAppCard(
          children: [
            Container(
              height: 54,
              child: Center(
                child: Text(
                  'Log in to your account',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            MaterialButton(
              height: 56,
              elevation: 0,
              color: AppTheme.signInButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => UserTypePage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/google_icon.png')),
                  SizedBox(width: 16),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Image(
                image: AssetImage('assets/login_img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}