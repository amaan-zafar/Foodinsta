import 'dart:io';

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
}
