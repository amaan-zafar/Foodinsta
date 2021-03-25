import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List posts = [];
  List orders = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          // AppBar
          CustomAppBar(
            actions: [
              CustomIconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Styles.iconColor,
                ),
              )
            ],
          ),

          // Body
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 18, 8, Styles.bottomPadding),
                child: CustomAppCard(
                  width: double.infinity,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 4, 0, 18),
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[400],
                        radius: 48,
                        child: Text('DP'),
                      ),
                    ),
                    Text(
                      'Aggarwal Sweets',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    SizedBox(height: 12),
                    Text(
                      'A-41, Sector 47 Gurgaon, Haryana 1010101',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.phone),
                          Text('+91-9313093130',
                              style: Theme.of(context).textTheme.bodyText1)
                        ],
                      ),
                    ),
                    UserTypeLabel(label: 'Business'),
                    buildTabs(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildTabs(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    Color tileColor =
        darkThemeProvider.darkTheme ? Styles.tileColorLight : Styles.black2;
    return DefaultTabController(
      length: 2,
      initialIndex: 0, // Change it according to user type
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: TabBar(
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: 'MY POSTS'),
                Tab(text: 'MY ORDERS'),
              ],
            ),
          ),
          Container(
              height: 400, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(children: <Widget>[
                buildPostsTab(tileColor),
                buildOrdersTab(tileColor),
              ]))
        ],
      ),
    );
  }

  Widget buildPostsTab(Color tileColor) {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ListTile(
                  tileColor: tileColor,
                  title: Column(
                    children: [Icon(Icons.group), Icon(Icons.line_weight)],
                  ),
                  trailing: CustomIconButton(
                    onPressed: () {},
                    icon: Icon(Icons.cancel),
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) => SizedBox(
                  height: 12,
                ),
            itemCount: 10));
  }

  Widget buildOrdersTab(Color tileColor) {
    return Container(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  tileColor: tileColor,
                  leading: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.green,
                  ),
                  title: SizedBox(
                    height: 28,
                    child: Text(
                      'Aggarwal Sweets',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  subtitle: Wrap(
                    children: [
                      UserTypeLabel(
                        label: 'Business',
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, i) => SizedBox(
                  height: 12,
                ),
            itemCount: 10));
  }
}
