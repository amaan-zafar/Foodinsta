import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_bottomnavbar.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/custom_dropdown.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart' as AppTheme;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 0;
bool _selectCity = false;

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 8)),
        height: MediaQuery.of(context).size.width * 0.22,
        width: MediaQuery.of(context).size.width * 0.22,
        child: FloatingActionButton(
          backgroundColor: AppTheme.iconColor,
          onPressed: () {},
          tooltip: 'Create a Post',
          child: Icon(Icons.add),
          elevation: 0.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          CustomBottomNavBarItem(
              iconData: Icons.home, text: '', color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.place_rounded,
              text: '',
              color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.photo, text: '', color: AppTheme.iconColor),
          CustomBottomNavBarItem(
              iconData: Icons.person, text: '', color: AppTheme.iconColor),
        ],
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    AppBar appBar = new AppBar();
    print('top padding $topPadding');
    print('bottom padding $bottomPadding');

    return Stack(children: [
      CustomBackground(),
      SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
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
                            color: Colors.white,
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
                                  color: AppTheme.iconColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'City',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      .copyWith(color: AppTheme.iconColor),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          CustomIconButton(
                            icon: Icon(
                              Icons.settings,
                              color: AppTheme.iconColor,
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
                              color: AppTheme.customApprovedButtonColor,
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
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: CustomAppCard(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 18),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.greenAccent[400],
                                radius: 24,
                                child: Text('DP'),
                              ), //Text
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Aggarwal sweets',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(fontSize: 14),
                                  ),
                                  Text(
                                    '6 hours ago',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text('Rating'),
                                  ClipRRect(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(64),
                                        right: Radius.circular(64)),
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 22),
                                        child: Text(
                                          'Business',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .copyWith(fontSize: 14),
                                        ),
                                      ),
                                      color: AppTheme.customApprovedButtonColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          width: double.infinity,
                          height: 240,
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
                                  borderRadius: BorderRadius.circular(16)),
                              onPressed: () {},
                              elevation: 0,
                              child: Text(
                                'Request',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            ],
          ),
        ),
      ),
    ]);
  }
}
