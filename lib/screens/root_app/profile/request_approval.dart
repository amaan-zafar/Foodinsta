import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/components/launcher_widgets.dart';
import 'package:food_insta/controllers/user_profile_controller.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/user.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../../theme.dart';

class RequestApprovalPage extends StatefulWidget {
  final int index;
  final String userStaticId;

  const RequestApprovalPage({Key key, this.index, this.userStaticId})
      : super(key: key);
  @override
  _RequestApprovalPageState createState() => _RequestApprovalPageState(index);
}

class _RequestApprovalPageState extends State<RequestApprovalPage> {
  String phone = "7870193349";
  final int index;
  UserObject userObject;

  _RequestApprovalPageState(this.index);

  @override
  void initState() {
    super.initState();
  }

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
                      Icons.close,
                      color: Styles.iconColor,
                    ),
                  )
                ],
              ),

              // Body
              Expanded(
                child: FutureBuilder<UserObject>(
                    future: Provider.of<UserProfileController>(context)
                        .getProfileWithId(widget.userStaticId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.none)
                        return Container(
                          child: Center(
                            child: Text('Check your internet connection'),
                          ),
                        );
                      else if (snapshot.connectionState ==
                          ConnectionState.waiting)
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      else {
                        if (snapshot.hasError)
                          return new Text('Error: ${snapshot.error}');
                        // else if (snapshot.data == null)
                        //   return Container(
                        //     child: Center(
                        //       child: Text('You have not created any post'),
                        //     ),
                        //   );
                        else {
                          userObject = snapshot.data;
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 48),
                              child: ProfileCard(
                                userObject: userObject,
                                json: requestsJson,
                                index: widget.index,
                                children: [
                                  SizedBox(height: 8),
                                  Divider(),
                                  Visibility(
                                    visible: requestsJson[index]['status'] == 0,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        'New Request',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: requestsJson[index]['status'] == 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            iconSize: 48,
                                            icon: Icon(
                                              MdiIcons.check,
                                              color: Styles
                                                  .customApprovedButtonColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                requestsJson[index]['satus'] =
                                                    1;
                                              });
                                            }),
                                        SizedBox(width: 8),
                                        IconButton(
                                            iconSize: 48,
                                            icon: Icon(
                                              MdiIcons.close,
                                              color: Styles
                                                  .customDeclineButtonColor,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                requestsJson[index]['satus'] =
                                                    -1;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible:
                                          requestsJson[index]['satus'] == -1,
                                      child: Text('Request Accepted!')),
                                  Visibility(
                                      visible:
                                          requestsJson[index]['satus'] == 1,
                                      child: Text('Request Accepted!')),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                      'Contact',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  LauncherWidgets(
                                    phone: phone,
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    }),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
