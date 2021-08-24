import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/user_profile_card.dart';
import 'package:food_insta/components/order_status_label.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/controllers/user_profile_controller.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/profile/offers.dart';
import 'package:food_insta/screens/root_app/profile/post_detail_screen.dart';
import 'package:food_insta/screens/root_app/qr_code/deal_completed.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/models/user_order.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:food_insta/models/user_post.dart';

import 'order_detail_screen.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserObject _userObject;
  List<UserPost> userPosts = [];
  List<UserOrder> userOrders = [];
  UserProfileController controller;

  // _fetchOrders() async {
  //   userOrders = await controller.getUserOrders();
  // }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<UserProfileController>(context);
    _userObject = controller.userObject;
    print("user object is " + _userObject.toString());
    // setState(() {
    //   _fetchOrders();
    // });
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
                      MaterialPageRoute(builder: (_) => OffersScreen()));
                },
                icon: Image.asset(
                  "assets/fi_coin.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              CustomIconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DealCompletedPage()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Styles.iconColor,
                ),
              ),
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
              return userPosts.length == 0
                  ? Center(
                      child: Text('You have not created any post'),
                    )
                  : Container(
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
                                                  PostDetailScreen(
                                                    index: index,
                                                    postStaticId:
                                                        userPosts[index]
                                                            .staticId,
                                                  )))
                                      : userPosts[index].postStatus ==
                                              UserPostStatus.Completed
                                          ? Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Deal Completed! CreatePost is not available now."),
                                            ))
                                          : Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Your post has expired")));
                                },
                                tileColor: tileColor,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child:
                                          // userPosts[index].prodImgFile != null
                                          //     ? Image.file(
                                          //         userPosts[index].prodImgFile,
                                          //         width: double.infinity,
                                          //         height: 200,
                                          //         fit: BoxFit.cover,
                                          //       )
                                          //     :
                                          Image(
                                        image: NetworkImage(
                                            userPosts[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: userPosts[index].postStatus ==
                                        UserPostStatus.Active
                                    ? Row(
                                        children: [
                                          Icon(MdiIcons.accountGroup,
                                              color: Styles
                                                  .customRequestButtonColor),
                                          SizedBox(width: 8),
                                          Text(userPosts[index]
                                              .numOfRequests
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
                                      userPosts[index].weight,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
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
    return FutureBuilder<List<UserOrder>>(
        future: controller.getUserOrders(),
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
                  child: Text('No orders placed'),
                ),
              );
            else {
              userOrders = snapshot.data;
              return userOrders.length == 0
                  ? Center(
                      child: Text('No orders placed'),
                    )
                  : Container(
                      child: ListView.builder(
                      itemCount: userOrders.length,
                      itemBuilder: (context, index) {
                        ORDERSTATUS status = userOrders[index].orderStatus;
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              // TODO: Pass post static_id to order detail
                              onTap: () {
                                status == ORDERSTATUS.COMPLETED
                                    ? Scaffold.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text(
                                            "Deal Completed! CreatePost is not available now."),
                                      ))
                                    : Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => OrderDetail(
                                                  index: index,
                                                  postStaticId:
                                                      userOrders[index]
                                                          .postStatiId,
                                                  // json: ordersJson,
                                                )));
                              },
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              tileColor: tileColor,
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userOrders[index].image),
                                radius: 34,
                              ),
                              title: SizedBox(
                                height: 28,
                                child: Text(
                                  userOrders[index].orderedTo,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                              subtitle: Wrap(
                                children: [
                                  OrderStatusLabel(orderstatus: status)
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ));
            }
          }
        });
  }
}
