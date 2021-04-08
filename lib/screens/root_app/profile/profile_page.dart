import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/user_profile_card.dart';
import 'package:food_insta/components/order_status_label.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/controllers/user_profile_controller.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/profile/order_detail_screen.dart';
import 'package:food_insta/screens/root_app/profile/post_detail_screen.dart';
import 'package:food_insta/screens/root_app/qr_code/deal_completed.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/models/order.dart';
import 'package:food_insta/models/post.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:food_insta/models/user_post.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserObject _userObject;
  List<UserPost> userPosts = [];
  UserProfileController controller;

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<UserProfileController>(context);
    _userObject = controller.userObject;
    return Column(
      children: [
        // AppBar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomAppBar(
            actions: [
              CustomIconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DealCompletedPage()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Styles.iconColor,
                ),
              )
            ],
          ),
        ),

        // Body
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: UserProfileCard(
              userObject: _userObject,
              children: [
                SizedBox(height: 8),
                Divider(),
                buildTabs(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildTabs(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    Color tileColor =
        darkThemeProvider.darkTheme ? Styles.black2 : Styles.tileColorLight;
    return DefaultTabController(
      length: 2,
      initialIndex: _userObject != null && _userObject.userType == UserType.NGO
          ? 1
          : 0, // Changing positions according to user type
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: TabBar(
              labelColor:
                  darkThemeProvider.darkTheme ? Colors.white : Styles.black1,
              unselectedLabelColor:
                  darkThemeProvider.darkTheme ? Colors.white70 : Styles.black2,
              tabs: [
                Tab(text: 'MY POSTS'),
                Tab(text: 'MY ORDERS'),
              ],
            ),
          ),
          Container(
              height: 400,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TabBarView(children: <Widget>[
                  buildPostsTab(tileColor),
                  buildOrdersTab(tileColor),
                ]),
              ))
        ],
      ),
    );
  }

  Widget buildPostsTab(Color tileColor) {
    return FutureBuilder<List<UserPost>>(
        future: controller.getUserPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none)
            return Container(
              child: Center(
                child: Text('Check your internet connection'),
              ),
            );
          else if (snapshot.connectionState == ConnectionState.waiting)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else if (snapshot.data == null)
              return Container(
                child: Center(
                  child: Text('You have not created any post'),
                ),
              );
            else {
              userPosts = snapshot.data;
              print('userpostsss is $userPosts');
              print(userPosts[0].staticId);
              print('List is ${snapshot.data}');
              return Container(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: ListTile(
                            onTap: () {
                              userPosts[index].postStatus ==
                                      UserPostStatus.Active
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PostDetail(index: index)))
                                  // : myPostJson[index]['status'] == 1
                                  //     ? Scaffold.of(context)
                                  //         .showSnackBar(SnackBar(
                                  //         content: Text(
                                  //             "Deal Completed! Post is not available now."),
                                  //       ))
                                  : Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Your post has expired")));
                            },
                            tileColor: tileColor,
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: 48,
                                height: 48,
                                child: Image(
                                  image: myPostJson[index]['img_url'] == null
                                      ? AssetImage('assets/food_large.png')
                                      : NetworkImage(
                                          myPostJson[index]['img_url']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: userPosts[index].postStatus ==
                                    UserPostStatus.Active
                                ? Row(
                                    children: [
                                      Icon(MdiIcons.accountGroup,
                                          color:
                                              Styles.customRequestButtonColor),
                                      SizedBox(width: 8),
                                      Text(myPostJson[index]['num_of_requests']
                                          .toString()),
                                      Spacer(),
                                    ],
                                  )
                                : userPosts[index].postStatus ==
                                        UserPostStatus.Expired
                                    ? Text('Expired')
                                    : Text('Completed'),
                            subtitle: Row(
                              children: [
                                Icon(MdiIcons.weight,
                                    color: Styles.blueIconColor),
                                SizedBox(width: 8),
                                Text(
                                  myPostJson[index]['weight'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Spacer(),
                              ],
                            ),
                            trailing: CustomIconButton(
                              color: userPosts[index].postStatus ==
                                      UserPostStatus.Active
                                  ? Styles.iconColor
                                  : userPosts[index].postStatus ==
                                          UserPostStatus.Completed
                                      ? Styles.customApprovedButtonColor
                                      : Styles.customDeclineButtonColor,
                              height: double.infinity,
                              elevation: 0,
                              onPressed: () {},
                              icon: Icon(
                                userPosts[index].postStatus ==
                                        UserPostStatus.Active
                                    ? MdiIcons.qrcode
                                    : userPosts[index].postStatus ==
                                            UserPostStatus.Active
                                        ? MdiIcons.check
                                        : MdiIcons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, i) => SizedBox(height: 12),
                      itemCount: userPosts.length));
            }
          }
        });
  }

  Widget buildOrdersTab(Color tileColor) {
    return Container(
        child: ListView.builder(
      itemCount: ordersJson.length,
      itemBuilder: (context, index) {
        ORDERSTATUS status;
        switch (ordersJson[index]['status']) {
          case 0:
            status = ORDERSTATUS.PENDING;
            break;
          case 1:
            status = ORDERSTATUS.APPROVED;
            break;
          case 2:
            status = ORDERSTATUS.REJECTED;
            break;
          case 3:
            status = ORDERSTATUS.COMPLETED;
            break;

          default:
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: ListTile(
            onTap: () {
              status == ORDERSTATUS.COMPLETED
                  ? Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Deal Completed! Post is not available now."),
                    ))
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetail(
                                index: index,
                                json: ordersJson,
                              )));
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            tileColor: tileColor,
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/placeholder_img.png'),
              radius: 34,
            ),
            title: SizedBox(
              height: 28,
              child: Text(
                ordersJson[index]['name'],
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 16),
              ),
            ),
            subtitle: Wrap(
              children: [OrderStatusLabel(orderstatus: status)],
            ),
          ),
        );
      },
    ));
  }
}
