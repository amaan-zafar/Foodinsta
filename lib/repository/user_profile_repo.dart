import 'package:flutter/services.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/models/user_post.dart';
import 'package:food_insta/models/user_order.dart';
import 'package:food_insta/models/post_request.dart';

class UserProfileRepository {
  final CustomHttpClient _customHttpClient;

  UserProfileRepository(
    this._customHttpClient,
  );

  Future<UserObject> getUserProfile() async {
    try {
      var response = await _customHttpClient.getRequest('users/profile',
          requireAuth: true);
      UserObject userObject = UserObject.fromProfileJson(response);
      return userObject;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<UserObject> getUserProfileWithId(id) async {
    var queryParameters = {
      'static_id': id,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'users/profile', queryParameters,
          requireAuth: true);

      UserObject userObject = UserObject.fromProfileJson(response);
      return userObject;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<List<UserPost>> getUserPostsList() async {
    try {
      var response = await _customHttpClient.getRequest('products/all_posts',
          requireAuth: true);
      List<UserPost> userPosts = [];
      response.forEach((i) {
        userPosts.add(UserPost.fromJson(i));
      });
      return userPosts;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<List<PostRequest>> getPostRequestsList(id) async {
    List<PostRequest> postRequests = [];
    var queryParameters = {
      'static_id': id,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'products/all_requests', queryParameters,
          requireAuth: true);
      response.forEach((i) {
        postRequests.add(PostRequest.fromJson(i));
      });
      return postRequests;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> getUserOrdersList() async {
    List<UserOrder> userOrders = [];
    try {
      var response = await _customHttpClient.getRequest('products/all_orders',
          requireAuth: true);
      response.forEach((i) {
        userOrders.add(UserOrder.fromJson(i));
      });
      return userOrders;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }
}
