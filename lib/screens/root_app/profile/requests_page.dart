import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/user_type_label.dart';
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
                          setState(() {});
                        },
                        icon: Icon(
                          MdiIcons.deleteEmpty,
                          color: Styles.iconColor,
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
                                  builder: (context) => RequestApprovalPage()));
                        },
                        child: CustomAppCard(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/placeholder_img.png'),
                                  radius: 24,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'NIRMAN',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(fontSize: 16),
                                      ),
                                      UserTypeLabel(
                                        label: 'Business',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                IconButton(
                                    iconSize: 24,
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Styles.customApprovedButtonColor,
                                    ),
                                    onPressed: () {}),
                                IconButton(
                                    iconSize: 24,
                                    icon: Icon(
                                      Icons.cancel,
                                      color: Styles.customDeclineButtonColor,
                                    ),
                                    onPressed: () {}),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => SizedBox(height: 12),
                    itemCount: 10),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
