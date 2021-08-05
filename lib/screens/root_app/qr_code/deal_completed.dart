import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/theme.dart';

class DealCompletedPage extends StatelessWidget {
  DealCompletedPage();
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
              ProfileCard(),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 12,
                            backgroundColor: Styles.customApprovedButtonColor,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                        SizedBox(width: 8),
                        Text(
                          'Deal Completed!',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 14),
                      child: Text(
                        'Would you like to rate your experience with this partner?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    RatingIndicator(
                      rating: 0,
                      itemSize: 36,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
