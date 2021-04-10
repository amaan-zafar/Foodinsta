import 'package:food_insta/models/product.dart';

class PostDetail {
  Product product;
  String createdAt;
  String staticId;
  int numOfRequests;
  Member member;
  double latitude;
  double longitude;
  String address;
  Null requestStatus;
  int contactNo;

  PostDetail(
      {this.product,
      this.createdAt,
      this.staticId,
      this.numOfRequests,
      this.member,
      this.address,
      this.requestStatus,
      this.contactNo});

  PostDetail.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    createdAt = json['created_at'];
    staticId = json['static_id'];
    numOfRequests = json['num_of_requests'];
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
    var latlong = json['location'].split(',');
    latitude = double.parse(latlong[0]);
    longitude = double.parse(latlong[1]);
    address = json['address'];
    requestStatus = json['request_status'];
    contactNo = json['contact_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['created_at'] = this.createdAt;
    data['static_id'] = this.staticId;
    data['num_of_requests'] = this.numOfRequests;
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    data['location'] =
        this.latitude.toString() + ',' + this.longitude.toString();
    data['address'] = this.address;
    data['request_status'] = this.requestStatus;
    data['contact_no'] = this.contactNo;
    return data;
  }
}

class Member {
  int contactNo;
  String memberType;
  String profilePic;
  String address;
  String city;
  String name;

  Member(
      {this.contactNo,
      this.memberType,
      this.profilePic,
      this.address,
      this.city,
      this.name});

  Member.fromJson(Map<String, dynamic> json) {
    contactNo = json['contact_no'];
    memberType = json['member_type'];
    profilePic = json['profile_pic'];
    address = json['address'];
    city = json['city'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact_no'] = this.contactNo;
    data['member_type'] = this.memberType;
    data['profile_pic'] = this.profilePic;
    data['address'] = this.address;
    data['city'] = this.city;
    data['name'] = this.name;
    return data;
  }
}
