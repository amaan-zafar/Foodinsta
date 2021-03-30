import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/screens/root_app/qr_code/deal_completed.dart';
import 'package:food_insta/theme.dart';
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
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
              child: Column(
            children: [
              // AppBar
              CustomAppBar(
                centerTitle: true,
              ),

              // Body
              Padding(
                padding: EdgeInsets.fromLTRB(24, height * 0.09, 24, 8),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Text(
                        'Scan QR code from your food provider to complete the deal!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Icon(
                      MdiIcons.qrcode,
                      color: Styles.iconColor,
                      size: 60,
                    ),
                    SizedBox(height: 20),
                    CustomTextButton(
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
                    ),
                    SizedBox(height: 20),
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
