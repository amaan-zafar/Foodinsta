import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:food_insta/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:food_insta/models/post_detail.dart';

class ItemCard extends StatelessWidget {
  final List<Widget> children;
  final json;
  final int index;
  final PostDetail postDetail;
  // TODO: Add this once image is fetched from backend
  // final File _foodImg;

  ItemCard({Key key, this.children, this.json, this.index, this.postDetail})
      : super(key: key);

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    }
  }

  static void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 48),
      child: CustomAppCard(
        children: [
          SizedBox(height: 8),
          Container(
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: json == null
                    ? AssetImage('assets/food_large.png')
                    : NetworkImage(json[index]['img_url']),
                fit: BoxFit.cover,
              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(16),
            //   child: Image.file(
            //     _foodImg,
            //     width: double.infinity,
            //     height: 200,
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              postDetail != null
                  ? postDetail.product.description
                  : json[index]['description'],
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(MdiIcons.weight, color: Styles.blueIconColor),
                      SizedBox(width: 8),
                      Text(
                        postDetail != null
                            ? postDetail.product.weight
                            : json[index]['weight'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(MdiIcons.accountGroup, color: Styles.blueIconColor),
                      SizedBox(width: 8),
                      Text(
                        postDetail != null
                            ? postDetail.numOfRequests.toString()
                            : json[index]['num_of_requests'].toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    json == null ? '6 hours ago' : json[index]['time'],
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Spacer(),
              MaterialButton(
                elevation: 0.0,
                height: 54,
                color: Styles.customApprovedButtonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                onPressed: () {
                  print(
                      'lat lang is ${postDetail.latitude}, ${postDetail.longitude}');
                  postDetail != null
                      ? navigateTo(postDetail.latitude, postDetail.longitude)
                      : navigateTo(json[index]['lat'], json[index]['lng']);
                },
                highlightColor: Colors.green,
                child: Row(
                  children: [
                    Icon(
                      MdiIcons.mapMarker,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Open Map',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          children != null
              ? Column(
                  children: children,
                )
              : Container(),
        ],
      ),
    );
  }
}
