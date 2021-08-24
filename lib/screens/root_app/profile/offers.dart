import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/theme.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen();

  @override
  Widget build(BuildContext context) {
    var top_brands = [];

    return Scaffold(
        body: Stack(
      children: [
        CustomBackground(),
        SafeArea(
          child: Column(
            children: [
              // AppBar
              CustomAppBar(
                title: "Shopping store",
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

              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                      elevation: 104,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(37, 25, 37, 25),
                        width: 326,
                        height: 108,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'My vouchers & coupons',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 18,
                                            height: 18,
                                            child: Image.asset(
                                                "assets/fi_coin.png"),
                                            padding: EdgeInsets.only(bottom: 2),
                                            margin: EdgeInsets.only(right: 4),
                                          ),
                                          Text(
                                            "Balance : 2050",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Color.fromARGB(
                                                        255, 85, 85, 85)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                              Center(
                                  child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              )),
                            ]),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      elevation: 104,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(37, 25, 37, 25),
                        width: 326,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Offers and Discounts',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Color.fromARGB(255, 85, 85, 85)),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Top Brands",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .copyWith(
                                            color: Color.fromARGB(
                                                255, 85, 85, 85)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )

              // Body
              /*  Expanded(
                child: FutureBuilder<PostDetail>(
                    future: Provider.of<PostController>(context)
                        .getPostDetail(widget.postStaticId),
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
                        else if (snapshot.data == null)
                          return Container(
                            child: Center(
                              child: Text('Post not available'),
                            ),
                          );
                        else {
                          postDetail = snapshot.data;
                          print(postDetail.toJson().toString());
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Stack(
                              children: [
                                ItemCard(
                                    postDetail: postDetail,
                                    index: widget.index,
                                    json: postDetail.toJson(),
                                    children: [
                                      SizedBox(height: 16),
                                      CustomTextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => RequestsPage(
                                                        postStaticId:
                                                            widget.postStaticId,
                                                      )));
                                        },
                                        textOnButton: 'Show requests',
                                        color: Styles.customRequestButtonColor,
                                      ),
                                      CustomTextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      QRCodePage()));
                                        },
                                        textOnButton: 'Show QR code',
                                        color: Styles.iconColor,
                                      ),
                                    ]),
                                Positioned(
                                  right: 44,
                                  top: 36,
                                  child: CustomIconButton(
                                    onPressed: () {
                                      showAlert(context, 'DELETE POST',
                                          'Are you sure you want to delete the post',
                                          () {
                                        setState(() {
                                          Navigator.pop(context);
                                          Navigator.pop(context);

                                          myPostJson.removeAt(widget.index);
                                        });
                                      }, () {
                                        Navigator.pop(context);
                                      });
                                    },
                                    icon: Icon(
                                      MdiIcons.deleteEmpty,
                                      color: Styles.customDeclineButtonColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      }
                    }),
              ) */
            ],
          ),
        )
      ],
    ));
  }
}
