import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';

class ProfileCard extends StatelessWidget {
  final List<Widget> children;

  const ProfileCard({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 8),
      child: CustomAppCard(
        width: double.infinity,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/placeholder_img.png'),
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            'Aggarwal Sweets',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'A-41, Sector 47 Gurgaon, Haryana 1010101',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone),
              Text('+91-9313093130',
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
          SizedBox(height: 12),
          RatingIndicator(
            rating: 4.5,
            itemSize: 22,
          ),
          SizedBox(height: 12),
          UserTypeLabel(
            label: 'Business',
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
