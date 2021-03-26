import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/theme.dart';

class OrderDetail extends StatelessWidget {
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
                      Icons.cancel_rounded,
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
                        UserTypeLabel(label: 'Business'),
                        SizedBox(height: 8),
                        Divider(),
                        Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://picsum.photos/250?image=9'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Text(
                            'ajfdoiajoisdjfoiakjdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.group),
                            Text('36'),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.store),
                            Text('50kg'),
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Request Pending',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        CustomTextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (_) {}));
                          },
                          textOnButton: 'Cancel Request',
                          color: Styles.customRejectedButtonColor,
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
