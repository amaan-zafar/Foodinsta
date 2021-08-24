import 'dart:io';

class Product {
  String description;
  // String freshUpto;
  String weight;
  var prodImg;
  String fileName;

  Product({this.description, this.weight, this.prodImg});

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    // freshUpto = json['fresh_upto'];
    weight = json['weight'];
    prodImg = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    // data['fresh_upto'] = this.freshUpto;
    data['weight'] = this.weight;
    data['image'] = this.prodImg;
    return data;
  }
}
