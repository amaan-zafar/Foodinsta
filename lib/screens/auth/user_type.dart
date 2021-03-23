import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_scaffold.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/screens/registration/registeration_page.dart';
import 'package:food_insta/utils.dart';

class UserTypePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
        CustomButton(
          textOnButton: 'I represent an NGO',
          onPressed: () {
            _navigateToRegisterationScreen(context, 0);
          },
        ),
        SizedBox(height: 24),
        CustomButton(
          textOnButton: 'I represent a Business',
          onPressed: () {
            _navigateToRegisterationScreen(context, 1);
          },
        ),
        SizedBox(height: 24),
        CustomButton(
          textOnButton: 'I am Solo/Volunteer',
          onPressed: () {
            _navigateToRegisterationScreen(context, 2);
          },
        ),
        SizedBox(height: 24),
      ],
    );
  }

  _navigateToRegisterationScreen(BuildContext context, int i) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => RegistrationForm(userType: i)));
  }
}
