import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_bottomnavbar.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/screens/root_app/home_page.dart';
import 'package:food_insta/screens/root_app/map_screen.dart';
import 'package:food_insta/screens/root_app/profile_page.dart';
import 'package:food_insta/screens/root_app/qrcode_page.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 3;

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: buildBody(context),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color:
                    darkThemeProvider.darkTheme ? Styles.black2 : Colors.white,
                width: 8)),
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width * 0.22,
        child: FloatingActionButton(
          backgroundColor: Styles.iconColor,
          onPressed: () {},
          tooltip: 'Create a Post',
          child: Icon(Icons.add),
          elevation: 0.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        onTabSelected: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        items: [
          CustomBottomNavBarItem(
              iconData: Icons.home, text: '', color: Styles.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.place_rounded, text: '', color: Styles.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.photo, text: '', color: Styles.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.person, text: '', color: Styles.iconColor),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(children: [
      CustomBackground(),
      SafeArea(
          child: pageIndex == 0
              ? HomePage()
              : pageIndex == 1
                  ? MapPage()
                  : pageIndex == 2
                      ? QRCodePage()
                      : ProfilePage()),
    ]);
  }
}
