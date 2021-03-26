import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_scaffold.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/models/app_types.dart';
import 'package:food_insta/screens/auth/registeration_screen.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';

class UserTypePage extends StatelessWidget {
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12, Styles.cardTopPadding,
                          12, Styles.cardBottomPadding),
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
                              color: Styles.buttonColor1,
                              textOnButton: 'I represent an NGO',
                              onPressed: () {
                                _navigateToRegisterationScreen(
                                    context, USERTYPE.NGO);
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: CustomTextButton(
                              color: Styles.buttonColor1,
                              textOnButton: 'I represent a Business',
                              onPressed: () {
                                _navigateToRegisterationScreen(
                                    context, USERTYPE.BUSINESS);
                              },
                            ),
                          ),
                          SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: CustomTextButton(
                              color: Styles.buttonColor1,
                              textOnButton: 'I am Individual/Volunteer',
                              onPressed: () {
                                _navigateToRegisterationScreen(
                                    context, USERTYPE.INDIVIDUAL);
                              },
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _navigateToRegisterationScreen(BuildContext context, USERTYPE userType) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => RegistrationForm(userType: userType)));
  }
}
