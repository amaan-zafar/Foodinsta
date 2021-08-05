import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';
import 'package:food_insta/models/user.dart';

class RegistrationRepository {
  final FlutterSecureStorage _secureStorage;
  final CustomHttpClient _customHttpClient;

  RegistrationRepository(
    this._customHttpClient,
    this._secureStorage,
  );

  Future registerUser(UserObject obj) async {
    var response;
    try {
      if (obj.userType == UserType.NGO) {
        response = await _customHttpClient.postRequest(
            'users/register/ngo/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "NGO",
                "city": obj.city,
                "address": obj.address,
              },
              "name": obj.name,
              "reg_number": obj.regisNo
            },
            requireAuth: false);
      } else if (obj.userType == UserType.INDIVIDUAL) {
        response = await _customHttpClient.postRequest(
            'users/register/individual/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "Individual",
                "city": obj.city,
                "address": obj.address,
              },
              "name": obj.name,
              "is_volunteer": false,
              "id_number": obj.volId,
            },
            requireAuth: false);
      } else if (obj.userType == UserType.VOLUNTEER) {
        response = await _customHttpClient.postRequest(
            'users/register/individual/',
            {
              "member": {
                "auth_user": {"email": obj.email},
                "contact_no": int.parse(obj.phone),
                "member_type": "Individual",
                "city": obj.city,
                "address": obj.address,
              },
              "name": obj.name,
              "is_volunteer": true,
              "id_number": obj.volId,
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
                "address": obj.address, //TODO profile_pic
              },
              "name": obj.name,
            },
            requireAuth: false);
      }
      print('reg response is $response');
      String access = response['access'];
      String refresh = response['refresh'];
      await _secureStorage.deleteAll();
      await _secureStorage.write(key: 'access', value: access);
      await _secureStorage.write(key: 'refresh', value: refresh);
      var jwt = await _secureStorage.read(key: 'access');
      print('jwt is $jwt');
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
