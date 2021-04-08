import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_bottomnavbar.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/controllers/user_profile_controller.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/repository/user_profile_repo.dart';
import 'package:food_insta/screens/root_app/home/home_page.dart';
import 'package:food_insta/screens/root_app/map_screen.dart';
import 'package:food_insta/screens/root_app/profile/profile_page.dart';
import 'package:food_insta/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:food_insta/screens/root_app/create_post/create_post_screen.dart';
import 'package:food_insta/screens/root_app/qr_code/scan_qr.dart';

int pageIndex = 0;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProfileController>(context, listen: false)
        .loadUserProfile();
  }

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
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreatePostPage()));
          },
          tooltip: 'Create a CreatePost',
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
              iconData: MdiIcons.qrcodeScan, text: '', color: Styles.iconColor),
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
                      ? ScanQR()
                      : ProfilePage()),
    ]);
  }
}
