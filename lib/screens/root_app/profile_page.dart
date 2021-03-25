import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          // AppBar
          CustomAppBar(
            actions: [
              CustomIconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Styles.iconColor,
                ),
              )
            ],
          ),

          // Body
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
            child: CustomAppCard(
              width: double.infinity,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 18),
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 48,
                    child: Text('DP'),
                  ),
                ),
                Text(
                  'Aggarwal Sweets',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 12),
                Text(
                  'A-41, Sector 47 Gurgaon, Haryana 1010101',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      Text('+91-9313093130',
                          style: Theme.of(context).textTheme.bodyText1)
                    ],
                  ),
                ),
                UserTypeLabel(label: 'Business')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: CustomTextButton(
              textOnButton: 'My posts and requests',
              onPressed: () {},
              color: Styles.buttonColor1,
            ),
          ),
          CustomTextButton(
            textOnButton: 'My orders',
            onPressed: () {},
            color: Styles.buttonColor1,
          ),
        ],
      ),
    );
  }
}
