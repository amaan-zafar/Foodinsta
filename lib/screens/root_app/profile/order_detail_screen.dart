import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/custom_background.dart';
import 'package:food_insta/components/custom_icon_button.dart';
import 'package:food_insta/components/custom_text_button.dart';
import 'package:food_insta/components/item_card.dart';
import 'package:food_insta/components/launcher_widgets.dart';
import 'package:food_insta/components/profile_card.dart';
import 'package:food_insta/theme.dart';

class OrderDetail extends StatefulWidget {
  final int index;
  final json;

  const OrderDetail({Key key, this.index, this.json}) : super(key: key);

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
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ProfileCard(
                        json: widget.json,
                        index: widget.index,
                      ),
                      ItemCard(
                        json: widget.json,
                        index: widget.index,
                        children: [
                          Divider(),
                          widget.json[widget.index]['status'] == 4
                              ? reqNotSent(context)
                              : widget.json[widget.index]['status'] == 1
                                  ? approved(context)
                                  : reqSent(context),
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

  Widget reqNotSent(context) {
    return CustomTextButton(
      onPressed: () {
        setState(() {
          widget.json[widget.index]['status'] = 0;
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
              widget.json[widget.index]['status'] = 4;
            });
          },
          textOnButton: 'Cancel Request',
          color: Styles.customRejectedButtonColor,
        ),
      ],
    );
  }
}
