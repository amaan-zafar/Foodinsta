import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_insta/theme.dart';

enum ORDERSTATUS { PENDING, APPROVED, REJECTED, COMPLETED }

class Order {
  String orderedTo;
  String createdTime;
  ORDERSTATUS orderStatus;
  File image;

  Order({this.orderedTo, this.createdTime, this.orderStatus, this.image});

  // Order.fromJson(Map<String, dynamic> json) {
  //   orderedTo = json['ordered_to'];
  //   createdTime = json['created_time'];
  //   orderStatus = json['order_status'];
  //   image = json['image'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['ordered_to'] = this.orderedTo;
  //   data['created_time'] = this.createdTime;
  //   data['order_status'] = this.orderStatus;
  //   data['image'] = this.image;
  //   return data;
  // }

  String toLabel(ORDERSTATUS orderstatus) {
    switch (orderStatus) {
      case ORDERSTATUS.APPROVED:
        return 'Approved';
      case ORDERSTATUS.COMPLETED:
        return 'Completed';
      case ORDERSTATUS.REJECTED:
        return 'Rejected';
      case ORDERSTATUS.PENDING:
        return 'Pending';
    }
    return 'Pending';
  }

  Color getOrderStatusColor(ORDERSTATUS orderstatus) {
    switch (orderStatus) {
      case ORDERSTATUS.APPROVED:
        return Styles.customApprovedButtonColor;

      case ORDERSTATUS.COMPLETED:
        return Styles.customRejectedButtonColor;

      case ORDERSTATUS.REJECTED:
        return Styles.customRejectedButtonColor;

      case ORDERSTATUS.PENDING:
        return Styles.customRejectedButtonColor;
    }
    return Styles.customRejectedButtonColor;
  }
}
