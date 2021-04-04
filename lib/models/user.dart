import 'dart:io';

enum UserType { NGO, BUSINESS, INDIVIDUAL, VOLUNTEER }

class UserObject {
  String name;
  String city;
  String phone;
  String address;
  File profileImage;
  String email;
  UserType userType;

  String regisNo;
  File idPhoto;

  bool isVol;
  String orgId;
  String volId;

  UserObject(
      {this.name,
      this.userType,
      this.city,
      this.address,
      this.email,
      this.volId,
      this.idPhoto,
      this.isVol,
      this.orgId,
      this.phone,
      this.profileImage,
      this.regisNo});

  UserObject.fromProfileJson(Map<String, dynamic> json) {
    phone = json['contact_no'].toString();
    userType = json['member_type'] == 'Individual'
        ? UserType.INDIVIDUAL
        : json['member_type'] == 'Volunteer'
            ? UserType.VOLUNTEER
            : json['member_type'] == 'Business'
                ? UserType.BUSINESS
                : UserType.NGO;
    profileImage = json['profile_pic'];
    address = json['address'];
    city = json['city'];
    name = json['name'];
  }
}
