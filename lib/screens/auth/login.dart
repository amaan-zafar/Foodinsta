import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
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
    return Scaffold(
      body: Container(
        color: AppTheme.bgColorBeginGradient,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width,
                  child: Center(
                    child: Text(
                      Constants.APP_LABEL,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 54),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 78,
                          child: Center(
                            child: Text(
                              'Log in to your account',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: MaterialButton(
                            height: 56,
                            elevation: 0,
                            color: AppTheme.signInButtonColor,
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
                                Image(
                                    image:
                                        AssetImage('assets/google_icon.png')),
                                SizedBox(width: 16),
                                Text(
                                  'Sign in with Google',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 48),
                          child: Image(
                            image: AssetImage('assets/login_img.png'),
                            fit: BoxFit.cover,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
