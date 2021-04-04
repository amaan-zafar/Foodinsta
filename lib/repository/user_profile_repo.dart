import 'package:flutter/services.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';

class UserProfileRepository {
  final CustomHttpClient _customHttpClient;

  UserProfileRepository(
    this._customHttpClient,
  );

  Future<dynamic> getUserProfile(id) async {
    try {
      var response = await _customHttpClient.getRequest('users/profile',
          requireAuth: true);
      print('response is $response');

      return response;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> getUserProfileWith(id) async {
    var queryParameters = {
      'static_id': id,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'users/profile', queryParameters,
          requireAuth: true);
      print('response is $response');

      return response;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> getUserPostsList(id) async {
    try {
      var response = await _customHttpClient.getRequest('products/all_posts',
          requireAuth: true);
      print('response is $response');

      return response;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> getPostRequestsLis(id) async {
    var queryParameters = {
      'static_id': id,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'products/all_posts', queryParameters,
          requireAuth: true);
      print('response is $response');

      return response;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> getUserOrdersList(id) async {
    try {
      var response = await _customHttpClient.getRequest('products/all_orders',
          requireAuth: true);
      print('response is $response');

      return response;
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
