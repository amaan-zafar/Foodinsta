import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_insta/models/app_types.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';

class RegistrationRepository {
  final FlutterSecureStorage _secureStorage;
  final CustomHttpClient _customHttpClient;

  RegistrationRepository(
    this._customHttpClient,
    this._secureStorage,
  );

  Future registerUser(UserObject obj, USERTYPE type) async {
    var response;
    try {
      if (type == USERTYPE.NGO) {
        response = await _customHttpClient.postRequest(
            'users/register/ngo/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "NGO",
                "city": obj.city,
                "address": obj.address
              },
              "name": obj.name,
              "reg_number": obj.regisNo
            },
            requireAuth: false);
      } else if (type == USERTYPE.INDIVIDUAL) {
        response = await _customHttpClient.postRequest(
            'users/register/individual/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "Volunteer",
                "city": obj.city,
                "address": obj.address
              },
              "name": obj.name,
              "is_volunteer": obj.isVol,
              "id_number": obj.id,
              "ngo_static_id": obj.orgId
            },
            requireAuth: false);
      } else {
        response = await _customHttpClient.postRequest(
            'users/register/restaurant/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "Restaurant",
                "city": obj.city,
                "address": obj.address
              },
              "name": obj.name,
            },
            requireAuth: false);
      }
      print('reg response is $response');
      String access = response['access'];
      String refresh = response['refresh'];
      await _secureStorage.write(key: 'access', value: access);
      await _secureStorage.write(key: 'refresh', value: refresh);
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return 0;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      await Authentication.signOut();
      return 0;
    }
  }
}

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
  final String id;

  UserObject(
      {this.city,
      this.name,
      this.address,
      this.email,
      this.id,
      this.idPhoto,
      this.isVol,
      this.orgId,
      this.phone,
      this.profileImage,
      this.regisNo});
}
