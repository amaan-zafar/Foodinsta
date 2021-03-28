import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RatingIndicator extends StatelessWidget {
  final double rating;
  final double itemSize;

  const RatingIndicator({Key key, this.rating, this.itemSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBarIndicator(
        rating: rating,
        itemBuilder: (context, index) => Icon(
          MdiIcons.crown,
          color: Color(0xFFFCBA1F),
        ),
        itemCount: 5,
        itemSize: itemSize,
      ),
    );
  }
}
