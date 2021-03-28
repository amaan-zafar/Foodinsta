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

  Future<int> signInWithGoogle() async {
    try {
      User user = await Authentication.signInWithGoogle();
      if (user == null)
        throw Failure('Sigin was aborted');
      else {
        print("API IS CALLED NOW");
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
        }
        return status;
      }
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
