import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';

class ProfileCard extends StatelessWidget {
  final List<Widget> children;
  final json;
  final int index;

  const ProfileCard({Key key, this.children, this.json, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
      child: CustomAppCard(
        width: double.infinity,
        children: [
          CircleAvatar(
            backgroundImage: json != null
                ? NetworkImage(json[index]['dp'])
                : AssetImage('assets/placeholder_img.png'),
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            json != null ? json[index]['name'] : 'Aggarwal Sweets',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home),
                Flexible(
                  child: Text(
                    json == null
                        ? 'A-41, Sector 47 Gurgaon, Haryana 1010101'
                        : json[index]['address'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text(json == null ? '+91-9313093130' : '+91-9313093130',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          SizedBox(height: 10),
          RatingIndicator(
            rating:
                // json != null && json == null ? json[index]['rating'] :
                4.5,
            itemSize: 22,
          ),
          SizedBox(height: 12),
          UserTypeLabel(
            // userType: userType,
            label: json != null && json == null
                ? json[index]['member_type']
                : 'Business',
            fontSize: 18,
            horizontalPadding: 32,
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
