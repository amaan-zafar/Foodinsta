import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:food_insta/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemCard extends StatelessWidget {
  final List<Widget> children;
  final json;
  final int index;

  const ItemCard({Key key, this.children, this.json, this.index})
      : super(key: key);

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
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
                image: AssetImage('assets/food_large.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              json == null
                  ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Posuere nulla non cursus lectus. Sit sagittis, nibh porta orci. Non consectetur tellus id purus pellentesque vitae velit vitae at.'
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
                        json == null ? ' 50kg' : json[index]['weight'],
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(MdiIcons.accountGroup, color: Styles.blueIconColor),
                      SizedBox(width: 8),
                      Text(
                        json == null
                            ? ' 36'
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
                  launchMap('Delhi, India');
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
