import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/components/launcher_widgets.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/controllers/post_controller.dart';
import 'package:food_insta/models/post_detail.dart';
import 'package:food_insta/theme.dart';
import 'package:provider/provider.dart';

class OrderDetail extends StatefulWidget {
  final String postStaticId;
  final int index;
  final json;

  OrderDetail({Key key, this.index, this.json, this.postStaticId})
      : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  PostDetail postDetail;
  @override
  Widget build(BuildContext context) {
    print('sts is ${widget.postStaticId}');
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
                  child: FutureBuilder<PostDetail>(
                      future: Provider.of<PostController>(context)
                          .getPostDetail(widget.postStaticId),
                      builder: (context, snapshot) {
                        print(widget.postStaticId);
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
                            print(postDetail.toJson());
                            return Column(
                              children: [
                                ProfileCard(
                                  json: postDetail.toJson(),
                                ),
                                ItemCard(
                                  postDetail: postDetail,
                                  json: postDetail.toJson(),
                                  index: widget.index,
                                  children: [
                                    Divider(),
                                    postDetail.requestStatus == 4
                                        ? reqNotSent(context)
                                        : postDetail.requestStatus == 1
                                            ? approved(context)
                                            : reqSent(context),
                                  ],
                                )
                              ],
                            );
                          }
                        }
                      }),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget reqNotSent(context) {
    return CustomTextButton(
      onPressed: () {
        setState(() {
          postDetail.requestStatus = 0;
        });
      },
      textOnButton: 'Send Request',
      color: Styles.customRequestButtonColor,
    );
  }

  Widget approved(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Request Approved!',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Contact :',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        LauncherWidgets(
          phone: '7870193349',
        ),
      ],
    );
  }

  Widget reqSent(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Request Pending',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        CustomTextButton(
          onPressed: () {
            setState(() {
              postDetail.requestStatus = 4;
            });
          },
          textOnButton: 'Cancel Request',
          color: Styles.customRejectedButtonColor,
        ),
      ],
    );
  }
}
