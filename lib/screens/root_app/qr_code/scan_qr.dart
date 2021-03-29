import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/screens/root_app/qr_code/deal_completed.dart';
import 'package:food_insta/screens/root_app/root_app.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanQR extends StatefulWidget {
  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String qrResult = 'Thanks for using our app.';
  String actualQrResult = 'Thanks for using our app.';
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
                          setState(() {
                            pageIndex = 0;
                          });
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Text(
                        'Scan QR code from your food provider to complete the deal!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(
                      MdiIcons.qrcode,
                      color: Styles.iconColor,
                      size: 54,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                        child: CustomTextButton(
                      textOnButton: 'Scan QR Code',
                      color: Styles.buttonColor2,
                      onPressed: () async {
                        scanner.scan().then((value) {
                          value == actualQrResult
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DealCompletedPage()))
                              : setState(() {
                                  qrResult = value;
                                });
                        });
                      },
                    ))
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
