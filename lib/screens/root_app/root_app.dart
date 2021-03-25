import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_bottomnavbar.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/screens/root_app/home_page.dart';
import 'package:food_insta/screens/root_app/profile_page.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 1;

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 8)),
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width * 0.22,
        child: FloatingActionButton(
          backgroundColor: AppTheme.iconColor,
          onPressed: () {},
          tooltip: 'Create a Post',
          child: Icon(Icons.add),
          elevation: 0.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          CustomBottomNavBarItem(
              iconData: Icons.home, text: '', color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.place_rounded,
              text: '',
              color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.photo, text: '', color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.person, text: '', color: AppTheme.iconColor),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      CustomBackground(),
      SafeArea(child: pageIndex == 0 ? HomePage() : ProfilePage()),
    ]);
  }
}
