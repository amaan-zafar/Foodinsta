import 'package:food_insta/models/product.dart';

class Post {
  Product product;
  String address;
  String location;
  String city;

  Post({this.product, this.address, this.location, this.city});

  Post.fromJson(Map<String, dynamic> json) {
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

const postJson = [
  {
    "description":
        "There is dal, rice and some chappatis in the meal. All the things are fresh and fit for eating.",
    "image": null,
    "weight": "50 meals",
    "member_type": "Business",
    "rating": 4.5,
    "name": "Haldirams",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 10
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "image": null,
    "weight": "36 kg",
    "member_type": "Individual",
    "rating": 5.0,
    "name": "Garvit",
    "time": "7 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 26
  },
  {
    "description":
        "There are 15 chaaps which were prepared in evening. The chaap is made with spices so will not be fresh by tomorrow morning. There is chutney also along with it.",
    "image": null,
    "weight": "15 meals",
    "member_type": "Business",
    "rating": 3.5,
    "name": "Dominos",
    "created_at": "26-03-2021 14:57:15",
    "time": "3 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 12
  },
  {
    "description": " ",
    "image": null,
    "weight": "50 meals",
    "member_type": "Business",
    "rating": 5.0,
    "name": "KFC",
    "time": "9 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 14
  },
  {
    "description":
        "There is dal, rice and some chappatis in the meal. All the things are fresh and fit for eating.",
    "image": null,
    "weight": "50 meals",
    "member_type": "Business",
    "rating": 4.5,
    "name": "Haldirams",
    "time": "1 day ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 10
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "image": null,
    "weight": "36 kg",
    "member_type": "Individual",
    "rating": 5.0,
    "name": "Amaan",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 26
  },
  {
    "description":
        "There are 15 chaaps which were prepared in evening. The chaap is made with spices so will not be fresh by tomorrow morning. There is chutney also along with it.",
    "image": null,
    "weight": "15 meals",
    "member_type": "Business",
    "rating": 3.5,
    "name": "Dominos",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 12
  },
  {
    "description": " ",
    "image": null,
    "weight": "50 meals",
    "member_type": "Business",
    "rating": 3.0,
    "name": "KFC",
    "time": "6 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 14
  }
];
