import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_alert.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/controllers/post_controller.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/post_detail.dart';
import 'package:food_insta/screens/root_app/profile/qrcode_page.dart';
import 'package:food_insta/screens/root_app/profile/requests_page.dart';
import 'package:food_insta/theme.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatefulWidget {
  final int index;
  final String postId;
  PostDetailScreen({Key key, this.index, this.postId}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetailScreen> {
  PostDetail postDetail;
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
                child: FutureBuilder<PostDetail>(
                    future: Provider.of<PostController>(context)
                        .getPostDetail(widget.postId),
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
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Stack(
                              children: [
                                ItemCard(
                                    postDetail: postDetail,
                                    index: widget.index,
                                    json: myPostJson,
                                    children: [
                                      SizedBox(height: 16),
                                      CustomTextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      RequestsPage()));
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
              )
            ],
          ),
        )
      ],
    ));
  }
}
