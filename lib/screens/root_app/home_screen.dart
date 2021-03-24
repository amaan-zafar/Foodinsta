import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_button.dart';
import 'package:food_insta/components/custom_card.dart';
import 'package:food_insta/remove_later/post_json.dart';
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:food_insta/constants.dart' as Constants;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomAppCard(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
            ),
            Column(
              children: [
                Text(
                  'Aggarwal Sweets',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '6 hours ago',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                CustomButton(
                  textOnButton: 'Business',
                  color: AppTheme.customButtonColor,
                  onPressed: () {},
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

// BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image:
//                             NetworkImage('https://picsum.photos/250?image=9'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
