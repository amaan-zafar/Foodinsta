import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/models/user.dart';

class UserProfileCard extends StatelessWidget {
  final List<Widget> children;
  final UserObject userObject;
  // final UserType userType;

  const UserProfileCard({
    Key key,
    this.children,
    this.userObject,
    // this.userType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 48),
      child: CustomAppCard(
        width: double.infinity,
        children: [
          CircleAvatar(
            backgroundImage:
                userObject == null || userObject.profileImage == null
                    ? AssetImage('assets/placeholder_img.png')
                    : FileImage(userObject.profileImage),
            radius: 48,
          ),
          SizedBox(height: 12),
          Text(
            userObject == null ? 'Aggarwal Sweets' : userObject.name,
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
                    userObject == null
                        ? 'A-41, Sector 47 Gurgaon, Haryana 1010101'
                        : userObject.address,
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
              Text(userObject == null ? '+91-9313093130' : userObject.phone,
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          // SizedBox(height: 10),
          // RatingIndicator(
          //   rating:
          //       // json != null && json == null ? json[index]['rating'] :
          //       4.5,
          //   itemSize: 22,
          // ),
          SizedBox(height: 12),
          UserTypeLabel(
            userType: userObject.userType,
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
