import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';

class AuthRepository {
  final FlutterSecureStorage _secureStorage;
  final CustomHttpClient _customHttpClient;

  AuthRepository(
    this._customHttpClient,
    this._secureStorage,
  );

  Future<Map<String, dynamic>> signInWithGoogle() async {
    try {
      User user = await Authentication.signInWithGoogle();
      if (user == null)
        throw Failure('Sigin was aborted');
      else {
        print("Login API IS CALLED NOW");
        var email = user.email;
        var response = await _customHttpClient.postRequest(
            'users/login/', {"firebase_id": user.uid},
            requireAuth: false);
        int status = response['status'];
        print('response is $response');
        print(status);
        if (status == 1) {
          await _secureStorage.write(key: 'access', value: response['access']);
          await _secureStorage.write(
              key: 'refresh', value: response['refresh']);
          await _secureStorage.write(key: 'firebase', value: user.uid);
        }
        Map<String, dynamic> map = {'status': status, 'email': email};
        print('map is $map');
        return map;
      }
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      await Authentication.signOut();
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await Authentication.signOut();
      await _secureStorage.delete(key: 'access');
      await _secureStorage.delete(key: 'refresh');
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
    }
  }
}
