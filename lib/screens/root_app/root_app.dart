import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_bottomnavbar.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart' as AppTheme;

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

int pageIndex = 0;

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
    return Stack(children: [
      CustomBackground(),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          decoration: BoxDecoration(gradient: AppTheme.bgLinearGradient),
          child: SafeArea(
            child: Column(
              children: [
                // AppBar
                Row(
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
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.place_rounded,
                                color: AppTheme.iconColor,
                              ),
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
                        MaterialButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color: AppTheme.iconColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // Body
                // ListView.builder(
                //   itemBuilder: (context, index) {
                //     return CustomAppCard(
                //       children: [
                //         Row(
                //           children: [
                //             Icon(Icons.person),
                //             Column(
                //               children: [
                //                 Text(
                //                   'Aggarwal sweets',
                //                   style: Theme.of(context).textTheme.subtitle1,
                //                 ),
                //                 Text(
                //                   '6 hours ago',
                //                   style: Theme.of(context).textTheme.subtitle1,
                //                 ),
                //               ],
                //             ),
                //             Spacer(),
                //             Column(
                //               children: [
                //                 Text('Rating'),
                //                 MaterialButton(
                //                   color: Color(0xFF34FF01),
                //                   shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(16)),
                //                   onPressed: () {},
                //                   elevation: 0,
                //                   child: Text(
                //                     'Business',
                //                     style:
                //                         Theme.of(context).textTheme.subtitle1,
                //                   ),
                //                 ),
                //               ],
                //             )
                //           ],
                //         ),
                //         SizedBox(
                //           width: double.infinity,
                //           height: 240,
                //         ),
                //         Row(
                //           children: [
                //             Icon(Icons.group),
                //             Text('36'),
                //             SizedBox(
                //               width: 8,
                //             ),
                //             Icon(Icons.store),
                //             Spacer(),
                //             MaterialButton(
                //               color: Color(0xFFF54580),
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(16)),
                //               onPressed: () {},
                //               elevation: 0,
                //               child: Text(
                //                 'Request',
                //                 style: Theme.of(context).textTheme.subtitle1,
                //               ),
                //             ),
                //           ],
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                //           child: Text(
                //             'ajfdoiajoisdjfoiakjdjfkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkjkaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                //             textAlign: TextAlign.center,
                //             style: Theme.of(context).textTheme.caption,
                //           ),
                //         )
                //       ],
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }

  Widget buildFooter() {
    List<IconData> bottomIcons = [
      Icons.home,
      Icons.map,
      Icons.add_box_outlined,
      Icons.person
    ];
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(bottomIcons.length, (index) {
          return InkWell(
            onTap: () {
              selectedTab(index);
            },
            child: Icon(
              bottomIcons[index],
              color: AppTheme.iconColor,
            ),
          );
        }),
      ),
    );
  }

  void selectedTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
