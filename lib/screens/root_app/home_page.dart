import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/models/dark_theme_provder.dart';
import 'package:food_insta/screens/root_app/settings_page.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _selectCity = false;

  final String apiUrl = "https://randomuser.me/api/?results=10";

  List<dynamic> _users = [];

  void fetchUsers() async {
    var result = await http
        .get(Uri.parse(apiUrl), headers: {"Accept": "application/json"});
    setState(() {
      _users = json.decode(result.body)['results'];
    });
  }

  String _name(dynamic user) {
    return user['name']['first'];
  }

  String _location(dynamic user) {
    return user['location']['country'];
  }

  String _age(Map<dynamic, dynamic> user) {
    return "Age: " + user['dob']['age'].toString();
  }

  Future<void> _getData() async {
    setState(() {
      fetchUsers();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        // AppBar
        SizedBox(
          height: 74,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  Constants.APP_LABEL,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Colors.white),
                ),
                Spacer(),
                Row(
                  children: [
                    MaterialButton(
                      elevation: 0.0,
                      color: darkThemeProvider.darkTheme
                          ? Styles.black2
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
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
                            'City',
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SettingsPage()));
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Styles.iconColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: false,
          child: SizedBox(
            height: 74,
            child: Row(
              children: [
                Row(
                  children: [
                    CustomIconButton(
                      onPressed: () {
                        setState(() {
                          _selectCity = false;
                        });
                      },
                      icon: Icon(
                        Icons.check,
                        color: Styles.customApprovedButtonColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // Body
        Expanded(
          child: _users.length != 0
              ? RefreshIndicator(
                  onRefresh: _getData,
                  child: ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: CustomAppCard(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 18),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 24,
                                      backgroundImage: NetworkImage(
                                          _users[index]['picture']['medium']),
                                    ),
                                    title: Text(_name(_users[index])),
                                    subtitle: Text(_location(_users[index])),
                                    trailing: Text(_age(_users[index])),
                                  )),
                              Container(
                                color: Colors.black,
                                child: Image.network(
                                    _users[index]['picture']['large']),
                                height: 200,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.group),
                                  Text('36'),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Icon(Icons.store),
                                  Spacer(),
                                  MaterialButton(
                                    color: Color(0xFFF54580),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    onPressed: () {},
                                    elevation: 0,
                                    child: Text(
                                      'Request',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                child: Text(
                                  'ajfdoiajoisdjfoiakjdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        )
      ],
    );
  }
}

// BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image:
//                             NetworkImage('https://picsum.photos/250?image=9'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
