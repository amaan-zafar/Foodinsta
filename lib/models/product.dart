class Product {
  String description;
  String freshUpto;
  String weight;

  Product({this.description, this.freshUpto, this.weight});

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    freshUpto = json['fresh_upto'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['fresh_upto'] = this.freshUpto;
    data['weight'] = this.weight;
    return data;
  }
}
