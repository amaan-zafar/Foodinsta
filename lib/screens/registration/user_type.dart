import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/screens/registration/registeration_page.dart';
import 'package:food_insta/utils.dart';

class UserTypePage extends StatelessWidget {
  Widget userTypeOptionButton(BuildContext context, int userType) {
    return CustomButton(
        textOnButton: 'I am ${Utils.getMemberType(userType)}',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => RegistrationForm()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(Constants.APP_LABEL),
        ),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Spacer(flex: 2),
                userTypeOptionButton(context, 0),
                Spacer(),
                userTypeOptionButton(context, 1),
                Spacer(),
                userTypeOptionButton(context, 2),
                Spacer(flex: 3),
              ],
            ),
          )),
    );
  }
}
