import 'dart:io';

enum USERTYPE { NGO, BUSINESS, INDIVIDUAL, VOLUNTEER }

class UserObject {
  final String name;
  final String city;
  final String phone;
  final String address;
  final File profileImage;
  final String email;

  final String regisNo;
  final File idPhoto;

  final bool isVol;
  final String orgId;
  final String volId;

  UserObject(
      {this.city,
      this.name,
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
