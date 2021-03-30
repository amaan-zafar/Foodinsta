import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/models/order.dart';
import 'package:food_insta/models/post.dart';
import 'package:food_insta/theme.dart';

class OrderDetail extends StatefulWidget {
  final ORDERSTATUS orderstatus;
  final int index;

  const OrderDetail({Key key, this.orderstatus, this.index}) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
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
                  child: Column(
                    children: [
                      ProfileCard(
                        json: postJson,
                        index: widget.index,
                      ),
                      ItemCard(
                        json: postJson,
                        index: widget.index,
                        children: [
                          Divider(),
                          postJson[widget.index]['requested'] == false
                              ? sendRequest(context)
                              : pendingRequest(context),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget sendRequest(context) {
    return CustomTextButton(
      onPressed: () {
        setState(() {
          postJson[widget.index]['requested'] = true;
        });
      },
      textOnButton: 'Send Request',
      color: Styles.customRequestButtonColor,
    );
  }

  Widget pendingRequest(context) {
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
              postJson[widget.index]['requested'] = false;
            });
          },
          textOnButton: 'Cancel Request',
          color: Styles.customRejectedButtonColor,
        ),
      ],
    );
  }
}
