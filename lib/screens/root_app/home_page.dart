import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/controllers/app_user_controller.dart';
import 'package:food_insta/controllers/dark_theme_provder.dart';
import 'package:food_insta/models/post.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/screens/root_app/settings_page.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:http/http.dart' as http;
import 'package:food_insta/models/order.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:convert';
import 'package:food_insta/screens/root_app/profile/order_detail_screen.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _selectCity = false;
  List<dynamic> _users = [];

  String city = 'Delhi';
  List<String> cities = ['Patna', 'Delhi', 'Patiala', 'Agra'];

  @override
  void initState() {
    String currentCity =
        Provider.of<AppUserController>(context, listen: false).userObject.city;
    cities.add(currentCity);
    city = currentCity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // AppBar
        buildAppBar(context),
        buildCitySelector(),
        // Body
        buildBody(),
      ],
    );
  }

  buildAppBar(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return CustomAppBar(
      actions: [
        MaterialButton(
          elevation: 0.0,
          color: darkThemeProvider.darkTheme ? Styles.black2 : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          onPressed: () {
            setState(() {
              _selectCity = true;
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.place_rounded,
                color: Styles.iconColor,
              ),
              SizedBox(width: 4),
              Text(
                city,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(color: Styles.iconColor),
              )
            ],
          ),
        ),
        SizedBox(width: 10),
        CustomIconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SettingsPage()));
          },
          icon: Icon(
            Icons.settings,
            color: Styles.iconColor,
          ),
        ),
      ],
    );
  }

  buildCitySelector() {
    return Visibility(
      visible: _selectCity,
      child: SizedBox(
        height: 74,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DropdownButton<String>(
              underline: Container(),
              hint: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(city, style: Theme.of(context).textTheme.bodyText1),
              ),
              isExpanded: true,
              elevation: 0,
              onChanged: (value) {
                setState(() {
                  print(value);
                  city = value;
                  _selectCity = false;
                });
              },
              items: cities.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  buildBody() {
    return Expanded(
        child: ListView.builder(
            itemCount: postJson.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: CustomAppCard(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OrderDetail(
                                      orderstatus: ORDERSTATUS.PENDING,
                                      index: index,
                                    )));
                      },
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: CircleAvatar(
                              backgroundImage: postJson == null
                                  ? AssetImage('assets/placeholder_img.png')
                                  : NetworkImage(postJson[index]['dp']),
                              radius: 24,
                            ),
                            title: Text(
                              postJson[index]['name'],
                              style: TextStyle(fontSize: 16),
                            ),
                            subtitle: Text(
                              postJson[index]['time'],
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                            trailing: Column(
                              children: [
                                RatingIndicator(
                                  itemSize: 15,
                                  rating: postJson[index]['rating'],
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                UserTypeLabel(
                                  horizontalPadding: 12,
                                  label: postJson[index]['member_type'],
                                ),
                              ],
                            ),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OrderDetail(
                                      orderstatus: ORDERSTATUS.PENDING,
                                      index: index,
                                    )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          color: Colors.black,
                          child: Image(
                            image: NetworkImage(postJson[index]['img_url']),
                            fit: BoxFit.cover,
                          ),
                          height: 220,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(MdiIcons.weight, color: Styles.blueIconColor),
                        SizedBox(width: 4),
                        Text(
                          postJson[index]['weight'],
                          style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Spacer(),
                        MaterialButton(
                          color: Color(0xFFF54580),
                          highlightColor: Colors.pink,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: () {
                            setState(() {
                              postJson[index]['requested'] =
                                  !postJson[index]['requested'];
                            });
                          },
                          child: Row(
                            children: [
                              Icon(MdiIcons.accountGroup, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 8, 0),
                                child: Text(
                                    postJson[index]['num_of_requests']
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color: Colors.white, fontSize: 13)),
                              ),
                              Text(
                                postJson[index]['requested'] == false
                                    ? 'Request'
                                    : 'Requested',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        postJson[index]['description'],
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
