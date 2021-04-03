import 'dart:io';

enum UserType { NGO, BUSINESS, INDIVIDUAL, VOLUNTEER }

class UserObject {
  final String name;
  final String city;
  final String phone;
  final String address;
  final File profileImage;
  final String email;
  final UserType userType;

  final String regisNo;
  final File idPhoto;

  final bool isVol;
  final String orgId;
  final String volId;

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
}
