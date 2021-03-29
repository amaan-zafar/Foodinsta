import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/models/order.dart';
import 'package:food_insta/models/post.dart';
import 'package:food_insta/theme.dart';

class OrderDetail extends StatelessWidget {
  final ORDERSTATUS orderstatus;
  final int index;

  const OrderDetail({Key key, this.orderstatus, this.index}) : super(key: key);
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
                  child: Column(
                    children: [
                      ProfileCard(),
                      ItemCard(
                        json: postJson,
                        index: index,
                        children: [
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
                              Navigator.pop(context);
                            },
                            textOnButton: 'Cancel Request',
                            color: Styles.customRejectedButtonColor,
                          ),
                        ],
                      )
                    ],
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
