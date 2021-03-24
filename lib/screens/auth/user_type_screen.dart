import 'package:flutter/material.dart';
import 'package:food_insta/components/app_scaffold.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/screens/auth/registeration_screen.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart' as AppTheme;

class UserTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppScaffold(
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, size.height / 6, 12, 0),
        child: CustomAppCard(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 36, 24, 8),
              child: Text(
                'Hello there! Together we can change this world, right?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Let’s get started by selecting the right kind of department you represent!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomTextButton(
                textOnButton: 'I represent an NGO',
                onPressed: () {
                  _navigateToRegisterationScreen(context, 0);
                },
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomTextButton(
                textOnButton: 'I represent a Business',
                onPressed: () {
                  _navigateToRegisterationScreen(context, 0);
                },
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: CustomTextButton(
                textOnButton: 'I am Solo/Volunteer',
                onPressed: () {
                  _navigateToRegisterationScreen(context, 0);
                },
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  _navigateToRegisterationScreen(BuildContext context, int i) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => RegistrationForm(userType: i)));
  }
}
