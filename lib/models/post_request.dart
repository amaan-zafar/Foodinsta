class PostRequest {
  String orderedBy;
  Null profilePic;
  String memberType;
  String memberStaticId;

  PostRequest(
      {this.orderedBy, this.profilePic, this.memberType, this.memberStaticId});

  PostRequest.fromJson(Map<String, dynamic> json) {
    orderedBy = json['ordered_by'];
    profilePic = json['profile_pic'];
    memberType = json['member_type'];
    memberStaticId = json['member_static_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ordered_by'] = this.orderedBy;
    data['profile_pic'] = this.profilePic;
    data['member_type'] = this.memberType;
    data['member_static_id'] = this.memberStaticId;
    return data;
  }
}
