import 'package:food_insta/models/product.dart';

class FeedPost {
  Product product;
  String address;
  String location;
  String city;

  FeedPost({this.product, this.address, this.location, this.city});

  FeedPost.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    address = json['address'];
    location = json['location'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['address'] = this.address;
    data['location'] = this.location;
    data['city'] = this.city;
    return data;
  }
}
