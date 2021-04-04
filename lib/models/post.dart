import 'package:food_insta/models/product.dart';

class Post {
  Product product;
  String address;
  String location;
  String city;
  int phone;

  Post({this.product, this.address, this.location, this.city, this.phone});

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

var postJson = [
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
    "num_of_requests": 10,
    "lat": 28.64593178928064,
    "lng": 77.21829874913111,
    "city": "Delhi",
    "address":
        "45, Ring Rd, Block H, Lajpat Nagar III, Sarojini Nagar, New Delhi, Delhi 110024",
    "requested": false,
    "status":
        4, // 0 = pending, 1=approved, 2 == rejected, 3 = completed, 4 = request not sent
    "dp":
        "https://lh3.googleusercontent.com/jMjT0ftTb8daeKL3OZQC95d5nHFN2bXYGvDubeKrxy9kkTI2v_kW3DxEbWTmaeJzQL4BKudcuh1sq0mbUU91nb9vWdM=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1567337710282-00832b415979?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=888&q=80"
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "image": null,
    "weight": "36 kg",
    "member_type": "Individual",
    "rating": 5.0,
    "name": "Kunal",
    "time": "7 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 26,
    "lat": 28.537793905155056,
    "lng": 77.18969050138567,
    "address": "Block C Adchini New Delhi, Delhi",
    "city": "Delhi",
    "requested": false,
    "status": 4,
    "dp":
        "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1564836235910-c3055ca0f912?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
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
    "num_of_requests": 12,
    "lat": 28.743613845655783,
    "lng": 77.11728966436809,
    "address":
        "Plot No. 15, Mangalam Place, Sector 3, Rohini, New Delhi, Delhi 110085",
    "city": "Delhi",
    "requested": false,
    "status": 4,
    "dp":
        "https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=669&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80"
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
    "num_of_requests": 14,
    "lat": 28.506624861046042,
    "lng": 77.08044279512399,
    "address": "Block C Adchini New Delhi, Delhi",
    "city": "Gurgaon",
    "requested": false,
    "status": 4,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1615380547279-f983fb6241d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80"
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
    "num_of_requests": 10,
    "lat": 28.50725842805748,
    "lng": 77.0914270586036,
    "address": "Block C Adchini New Delhi, Delhi",
    "city": "Gurgaon",
    "requested": false,
    "status": 4,
    "dp":
        "https://lh3.googleusercontent.com/jMjT0ftTb8daeKL3OZQC95d5nHFN2bXYGvDubeKrxy9kkTI2v_kW3DxEbWTmaeJzQL4BKudcuh1sq0mbUU91nb9vWdM=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1567337710282-00832b415979?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=888&q=80"
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "image": null,
    "weight": "36 kg",
    "member_type": "Individual",
    "rating": 5.0,
    "name": "David",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 26,
    "lat": 28.567031815140183,
    "lng": 77.32083836476494,
    "address":
        "Plot No, A2, Maharaja Agrasen Marg, Sector 38, Noida, Uttar Pradesh 201301",
    "city": "Noida",
    "requested": false,
    "status": 4,
    "dp":
        "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1564836235910-c3055ca0f912?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
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
    "num_of_requests": 12,
    "lat": 28.582661770197873,
    "lng": 77.31779632345417,
    "address": "Sector 18, Noida, Uttar Pradesh 201301",
    "city": "Noida",
    "requested": false,
    "status": 4,
    "dp":
        "https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=669&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80"
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
    "num_of_requests": 14,
    "lat": 28.602011176000357,
    "lng": 77.3260319453943,
    "address": "No P/21, Atta Market, Sector 18, Noida, Uttar Pradesh 201301",
    "city": "Noida",
    "requested": false,
    "status": 4,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1615380547279-f983fb6241d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80"
  }
];

var myPostJson = [
  {
    "description":
        "There is dal, rice and some chappatis in the meal. All the things are fresh and fit for eating.",
    "weight": "50 meals",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 4,
    "lat": 28.649547323130424,
    "lng": 77.09882243372553,
    "requested": false,
    "status": 0,
    "img_url":
        "https://images.unsplash.com/photo-1567337710282-00832b415979?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=888&q=80"
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "weight": "36 kg",
    "time": "7 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 12,
    "lat": 28.54327886621543,
    "lng": 77.19318626055964,
    "requested": false,
    "status": 1,
    "img_url":
        "https://images.unsplash.com/photo-1564836235910-c3055ca0f912?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
  },
  {
    "description":
        "There are 15 chaaps which were prepared in evening. The chaap is made with spices so will not be fresh by tomorrow morning. There is chutney also along with it.",
    "weight": "15 meals",
    "name": "Dominos",
    "created_at": "26-03-2021 14:57:15",
    "time": "3 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 9,
    "lat": 28.633887124128144,
    "lng": 77.22259424581607,
    "requested": false,
    "status": 2,
    "img_url":
        "https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80"
  },
  {
    "description": " ",
    "weight": "50 meals",
    "rating": 5.0,
    "time": "9 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 5,
    "lat": 28.63390839372382,
    "lng": 77.21829046854496,
    "requested": false,
    "status": 1,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1615380547279-f983fb6241d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80"
  },
  {
    "description":
        "There is dal, rice and some chappatis in the meal. All the things are fresh and fit for eating.",
    "weight": "50 meals",
    "time": "1 day ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 4,
    "lat": 28.649547323130424,
    "lng": 77.09882243372553,
    "requested": false,
    "status": 0,
    "img_url":
        "https://images.unsplash.com/photo-1567337710282-00832b415979?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=888&q=80"
  },
];

var requestsJson = [
  {
    "member_type": "NGO",
    "rating": 4.0,
    "name": "NSS",
    "lat": 28.53390839372382,
    "lng": 77.61829046854496,
    "address": "Pilani, Rajasthan, India",
    "accepted": false,
    "status": 0,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
  },
  {
    "member_type": "NGO",
    "rating": 5.0,
    "name": "Nirman",
    "lat": 28.69390839372382,
    "lng": 77.51829046854496,
    "address": "Pilani, Rajasthan, India",
    "accepted": false,
    "status": 0,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
  },
  {
    "member_type": "Individual",
    "rating": 4.5,
    "name": "Rahul",
    "lat": 27.63390839372382,
    "lng": 77.41829046854496,
    "accepted": false,
    "address": "No P/21, Atta Market, Sector 18, Noida, Uttar Pradesh 201301",
    "status": 0,
    "dp":
        "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80",
  },
  {
    "member_type": "Individual",
    "rating": 5.0,
    "name": "Kunal",
    "lat": 28.69390839372382,
    "lng": 77.51829046854496,
    "address": "No P/21, Atta Market, Sector 18, Noida, Uttar Pradesh 201301",
    "accepted": false,
    "status": 0,
    "dp":
        "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  },
];

var ordersJson = [
  {
    "description": " ",
    "image": null,
    "weight": "20 meals",
    "member_type": "Business",
    "rating": 5.0,
    "name": "Pizza Hut",
    "time": "9 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 14,
    "lat": 28.63390839372382,
    "lng": 77.21829046854496,
    "address": "Sector 50, Noida, Uttar Pradesh 201301",
    "requested": false,
    "status": 0,
    "dp":
        "https://lh3.googleusercontent.com/QBUjcghpZYfVBfz39U-b2NTWq6530mP7cIHYS9iHWPDmUIyhZB8Iapkb1Ijc82D1nsZ1fW3NXdsS07Jl7y-rMEmtN3A=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1615380547279-f983fb6241d5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80"
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
    "num_of_requests": 10,
    "lat": 28.649547323130424,
    "lng": 77.09882243372553,
    "address":
        "45, Ring Rd, Block H, Lajpat Nagar III, Sarojini Nagar, New Delhi, Delhi 110024",
    "requested": false,
    "status": 1,
    "dp":
        "https://lh3.googleusercontent.com/jMjT0ftTb8daeKL3OZQC95d5nHFN2bXYGvDubeKrxy9kkTI2v_kW3DxEbWTmaeJzQL4BKudcuh1sq0mbUU91nb9vWdM=w1000",
    "img_url":
        "https://images.unsplash.com/photo-1567337710282-00832b415979?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=888&q=80"
  },
  {
    "description":
        "The food was prepared today morning. There is rice and curry, such that there are 12 kg of curry and 24 kg rice.",
    "image": null,
    "weight": "36 kg",
    "member_type": "Individual",
    "rating": 5.0,
    "name": "David",
    "time": "5 hours ago",
    "static_id": "7b7e4e55-19cb-4ae1-aae3-0c77e4e773bd",
    "num_of_requests": 26,
    "lat": 28.54327886621543,
    "lng": 77.19318626055964,
    "address":
        "Plot No, A2, Maharaja Agrasen Marg, Sector 38, Noida, Uttar Pradesh 201301",
    "requested": false,
    "status": 1,
    "dp":
        "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1049&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1564836235910-c3055ca0f912?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
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
    "num_of_requests": 12,
    "lat": 28.633887124128144,
    "lng": 77.22259424581607,
    "address":
        "Plot No. 15, Mangalam Place, Sector 3, Rohini, New Delhi, Delhi 110085",
    "requested": false,
    "status": 0,
    "dp":
        "https://images.unsplash.com/photo-1594007654729-407eedc4be65?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=669&q=80",
    "img_url":
        "https://images.unsplash.com/photo-1574126154517-d1e0d89ef734?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80"
  },
];
