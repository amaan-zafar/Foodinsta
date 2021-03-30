import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_alert.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/models/post.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:food_insta/screens/root_app/profile/request_approval.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomBackground(),
          SafeArea(
              child: Column(
            children: [
              // AppBar
              CustomAppBar(
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Styles.iconColor,
                    ),
                  )
                ],
              ),
              // Delete All Requests
              Container(
                height: 74,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Requests',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.white),
                      ),
                      CustomIconButton(
                        onPressed: () {
                          showAlert(context, 'DELETE ALL REQUESTS',
                              'Are you sure you want to delete all requests?',
                              () {
                            setState(() {
                              requestsJson.clear();
                              Navigator.pop(context);
                            });
                          }, () {
                            Navigator.pop(context);
                          }).show();
                        },
                        icon: Icon(
                          MdiIcons.deleteEmpty,
                          color: Styles.customDeclineButtonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Requests card
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RequestApprovalPage(
                                        index: index,
                                      )));
                        },
                        child: CustomAppCard(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: requestsJson[index]['dp'] ==
                                          null
                                      ? AssetImage('assets/placeholder_img.png')
                                      : NetworkImage(requestsJson[index]['dp']),
                                  radius: 28,
                                ),
                                SizedBox(width: 12),
                                Column(
                                  children: [
                                    Text(
                                      requestsJson[index]['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(fontSize: 18),
                                    ),
                                    UserTypeLabel(
                                      horizontalPadding: 12,
                                      fontSize: 12,
                                      label: requestsJson[index]['member_type'],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Visibility(
                                  visible: requestsJson[index]['status'] == 0,
                                  child: CustomIconButton(
                                    color: Styles.customApprovedButtonColor,
                                    height: 42,
                                    elevation: 0,
                                    onPressed: () {
                                      setState(() {
                                        requestsJson[index]['status'] = 1;
                                      });
                                    },
                                    icon: Icon(
                                      MdiIcons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: requestsJson[index]['status'] == 0,
                                  child: CustomIconButton(
                                    color: Styles.customDeclineButtonColor,
                                    height: 42,
                                    elevation: 0,
                                    onPressed: () {
                                      setState(() {
                                        requestsJson.removeAt(index);
                                      });
                                    },
                                    icon: Icon(
                                      MdiIcons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible: requestsJson[index]['status'] != 0,
                                    child: Icon(
                                      MdiIcons.checkDecagram,
                                      color: Styles.customApprovedButtonColor,
                                      size: 28,
                                    ))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => SizedBox(height: 12),
                    itemCount: requestsJson.length),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
