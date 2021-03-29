import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class LauncherWidgets extends StatelessWidget {
  final String phone;

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  const LauncherWidgets({Key key, this.phone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButton(
            height: 64,
            color: Styles.buttonColor2,
            onPressed: () {
              _launchURL('sms:$phone');
            },
            icon: Icon(MdiIcons.androidMessages, color: Colors.white),
          ),
          CustomIconButton(
            height: 64,
            onPressed: () {
              _launchURL('tel:$phone');
            },
            color: Styles.buttonColor2,
            icon: Icon(MdiIcons.phone, color: Colors.white),
          ),
          CustomIconButton(
            height: 64,
            onPressed: () {
              _launchURL('whatsapp://send?phone=$phone');
            },
            color: Styles.buttonColor2,
            icon: Icon(MdiIcons.whatsapp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
