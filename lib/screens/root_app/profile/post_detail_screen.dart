import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/screens/root_app/profile/qrcode_page.dart';
import 'package:food_insta/screens/root_app/profile/requests_page.dart';
import 'package:food_insta/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostDetail extends StatelessWidget {
  String randomImg = 'https://picsum.photos/250?image=9';
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
                child: Stack(
                  children: [
                    ItemCard(children: [
                      SizedBox(height: 16),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RequestsPage()));
                        },
                        textOnButton: 'Show requests',
                        color: Styles.customRequestButtonColor,
                      ),
                      CustomTextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => QRCodePage()));
                        },
                        textOnButton: 'Show QR code',
                        color: Styles.iconColor,
                      ),
                    ]),
                    Positioned(
                      right: 44,
                      top: 36,
                      child: CustomIconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.deleteEmpty,
                          color: Styles.customDeclineButtonColor,
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    ));
  }
}
