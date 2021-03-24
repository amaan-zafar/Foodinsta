import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/screens/root_app/home_screen.dart';
import 'package:food_insta/theme.dart' as AppTheme;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 0;

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildAppBar(),
      bottomNavigationBar: buildFooter(),
    );
  }

  Widget buildAppBar() {
    return Container(
      height: double.infinity,
      color: Colors.black,
      child: Container(
        width: double.infinity,
        height: 100,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  Constants.APP_LABEL,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        decoration: BoxDecoration(gradient: AppTheme.bgLinearGradient),
      ),
    );
    // if (pageIndex == 0) {
    //   return AppBar(
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Icon(Icons.camera),
    //         Text('My feed'),
    //         Icon(Icons.notifications)
    //       ],
    //     ),
    //   );
    // } else if (pageIndex == 1) {
    //   return AppBar(
    //     title: Center(
    //       child: Text('Search'),
    //     ),
    //   );
    // } else if (pageIndex == 2) {
    //   return AppBar(
    //     title: Row(
    //       children: [
    //         Text('Profile'),
    //         Spacer(),
    //         Icon(Icons.notifications),
    //       ],
    //     ),
    //   );
    // }
  }

  Widget buildBody() {
    List<Widget> pages = [
      HomePage(),
      Center(
        child: Text('RootApp Page'),
      ),
      Center(
        child: Text('Create a post'),
      ),
      Center(
        child: Text('Profile Page'),
      ),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget buildFooter() {
    List<IconData> bottomIcons = [
      Icons.home,
      Icons.map,
      Icons.add_box_outlined,
      Icons.person
    ];
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomIcons.length, (index) {
          return InkWell(
            onTap: () {
              selectedTab(index);
            },
            child: Icon(
              bottomIcons[index],
              color: AppTheme.iconColor,
            ),
          );
        }),
      ),
    );
  }

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
