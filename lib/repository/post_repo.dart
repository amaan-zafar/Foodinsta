import 'package:flutter/services.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';
import 'package:food_insta/models/post.dart';

class PostRepository {
  final CustomHttpClient _customHttpClient;

  PostRepository(
    this._customHttpClient,
  );

  Future<void> createPost(Post post) async {
    var response;
    try {
      response = response = await _customHttpClient.postRequest(
          'users/register/ngo/',
          {
            "product": {
              "description": post.product.description,
              "fresh_upto": post.product.freshUpto,
              "weight": post.product.weight
            },
            "address": post.address,
            "location": post.location,
            "city": post.city
          },
          requireAuth: true);
      print('create post response is $response');
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
