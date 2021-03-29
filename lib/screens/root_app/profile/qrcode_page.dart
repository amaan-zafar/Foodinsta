import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePage extends StatelessWidget {
  String textToCode = 'Thank you for using FoodInsta';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
              child: Column(
            children: [
              // AppBar
              SizedBox(
                height: 74,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Text(
                        Constants.APP_LABEL,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white),
                      ),
                      Spacer(),
                      SizedBox(width: 10),
                      CustomIconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Styles.iconColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Body
              Padding(
                padding: EdgeInsets.fromLTRB(24, height * 0.15, 24, 8),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    SizedBox(height: 18),
                    Container(
                      width: width * 0.6,
                      child: Text(
                        'Show this QR Code to complete the deal',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 18),
                    QrImage(
                      data: textToCode,
                      size: width * 0.6,
                      gapless: true,
                      foregroundColor: Styles.iconColor,
                    ),
                    SizedBox(height: 18),
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
