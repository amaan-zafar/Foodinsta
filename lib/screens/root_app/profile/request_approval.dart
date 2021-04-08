import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/components/launcher_widgets.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../theme.dart';

class RequestApprovalPage extends StatefulWidget {
  final int index;

  const RequestApprovalPage({Key key, this.index}) : super(key: key);
  @override
  _RequestApprovalPageState createState() => _RequestApprovalPageState(index);
}

class _RequestApprovalPageState extends State<RequestApprovalPage> {
  String phone = "7870193349";
  final int index;

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
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: ProfileCard(
                      json: requestsJson,
                      index: widget.index,
                      children: [
                        SizedBox(height: 8),
                        Divider(),
                        Visibility(
                          visible: requestsJson[index]['status'] == 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'New Request',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: requestsJson[index]['status'] == 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  iconSize: 48,
                                  icon: Icon(
                                    MdiIcons.check,
                                    color: Styles.customApprovedButtonColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      requestsJson[index]['satus'] = 1;
                                    });
                                  }),
                              SizedBox(width: 8),
                              IconButton(
                                  iconSize: 48,
                                  icon: Icon(
                                    MdiIcons.close,
                                    color: Styles.customDeclineButtonColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      requestsJson[index]['satus'] = -1;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Visibility(
                            visible: requestsJson[index]['satus'] == -1,
                            child: Text('Request Accepted!')),
                        Visibility(
                            visible: requestsJson[index]['satus'] == 1,
                            child: Text('Request Accepted!')),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Contact',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                        LauncherWidgets(
                          phone: phone,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
