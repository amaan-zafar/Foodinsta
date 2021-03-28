import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';
import 'package:http/http.dart' as http;

class CreatePostRepository {
  final FlutterSecureStorage _secureStorage;
  final CustomHttpClient _customHttpClient;

  CreatePostRepository(
    this._customHttpClient,
    this._secureStorage,
  );

  Future createPost() async {
    var response;
    try {} on PlatformException catch (error) {
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
