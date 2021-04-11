import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_label.dart';
import 'package:food_insta/theme.dart';
import 'package:food_insta/models/user_order.dart';

class OrderStatusLabel extends StatelessWidget {
  final ORDERSTATUS orderstatus;

  OrderStatusLabel({Key key, this.orderstatus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String label;
    Color color;
    if (orderstatus == ORDERSTATUS.APPROVED) {
      label = 'Approved';
      color = Styles.customApprovedButtonColor;
    } else if (orderstatus == ORDERSTATUS.PENDING) {
      label = 'Pending';
      color = Styles.customPendingColor;
    } else if (orderstatus == ORDERSTATUS.REJECTED) {
      label = 'Rejected';
      color = Styles.customRejectedButtonColor;
    } else if (orderstatus == ORDERSTATUS.COMPLETED) {
      label = 'Completed';
      color = Styles.customCompletedButtonColor;
    }
    return CustomLabel(
      color: color,
      label: label,
    );
  }
}
