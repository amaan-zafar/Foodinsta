enum UserPostStatus { Active, Completed, Expired }

class UserPost {
  int numOfRequests;
  String weight;
  var image;
  UserPostStatus postStatus;
  String staticId;

  UserPost(
      {this.numOfRequests,
      this.weight,
      this.image,
      this.postStatus,
      this.staticId});

  UserPostStatus _getUserPostStatusCode(String status) {
    switch (status) {
      case 'Expired':
        return UserPostStatus.Expired;
      case 'Active':
        return UserPostStatus.Active;
      case 'Completed':
        return UserPostStatus.Completed;
      default:
        return UserPostStatus.Active;
    }
  }

  UserPost.fromJson(Map<String, dynamic> json) {
    numOfRequests = json['num_of_requests'];
    weight = json['weight'];
    image = json['image'];
    postStatus = _getUserPostStatusCode(json['post_status']);
    staticId = json['static_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['num_of_requests'] = this.numOfRequests;
  //   data['weight'] = this.weight;
  //   data['image'] = this.image;
  //   data['post_status'] = this.postStatus;
  //   data['static_id'] = this.staticId;
  //   return data;
  // }
}
