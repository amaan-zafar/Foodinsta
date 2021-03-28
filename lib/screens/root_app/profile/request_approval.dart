import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../theme.dart';

class RequestApprovalPage extends StatelessWidget {
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
              CustomAppBar(
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Styles.iconColor,
                    ),
                  )
                ],
              ),

              // Body
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
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
                        RatingIndicator(
                          itemSize: 20,
                          rating: 4.5,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        UserTypeLabel(label: 'Business'),
                        SizedBox(height: 8),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'New Request',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                iconSize: 40,
                                icon: Icon(
                                  Icons.cancel,
                                  color: Styles.customDeclineButtonColor,
                                ),
                                onPressed: () {}),
                            IconButton(
                                iconSize: 40,
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Styles.customApprovedButtonColor,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Contact',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              height: 64,
                              color: Styles.buttonColor2,
                              onPressed: () {},
                              icon: Icon(MdiIcons.androidMessages),
                            ),
                            CustomIconButton(
                              height: 64,
                              onPressed: () {},
                              color: Styles.buttonColor2,
                              icon: Icon(MdiIcons.phone),
                            ),
                            CustomIconButton(
                              height: 64,
                              onPressed: () {},
                              color: Styles.buttonColor2,
                              icon: Icon(MdiIcons.whatsapp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
