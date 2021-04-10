import 'package:flutter/services.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/feed_post.dart';
import 'package:food_insta/models/post_detail.dart';

class PostRepository {
  final CustomHttpClient _customHttpClient;

  PostRepository(
    this._customHttpClient,
  );

  Future<void> createPost(CreatePost post) async {
    var response;
    try {
      response = response = await _customHttpClient.postRequest(
          'products/new/',
          {
            "product": {
              "description": post.product.description,
              // "fresh_upto": post.product.freshUpto,
              "weight": post.product.weight
            },
            "contact_no": post.phone,
            "address": post.address,
            "location": post.location,
            "city": post.city
          },
          requireAuth: true);
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return 0;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return 0;
    }
  }

  Future<void> createOrder(id) async {
    var response;
    try {
      response = response = await _customHttpClient.postRequest(
          'products/new_order/', {"static_id": id},
          requireAuth: true);
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return 0;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return 0;
    }
  }

  Future<List<FeedPost>> getFeedPosts(String city) async {
    var queryParameters = {
      'city': city,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'products/list', queryParameters,
          requireAuth: true);
      List<FeedPost> feedPosts = [];
      response.forEach((i) {
        feedPosts.add(FeedPost.fromJson(i));
      });
      return feedPosts;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<PostDetail> getPostWithId(id) async {
    var queryParameters = {
      'static_id': id,
    };
    try {
      var response = await _customHttpClient.getRequestWithParams(
          'products/detail', queryParameters,
          requireAuth: true);
      PostDetail postDetail = PostDetail.fromJson(response);
      return postDetail;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      return null;
    }
  }

  Future<dynamic> updateOrderStatus(postId, userId, orderStatus) async {
    try {
      var response = await _customHttpClient.postRequest(
          'products/update_order_status/',
          {
            "post_static_id": postId,
            "ordered_by_static_id": userId,
            "order_status": orderStatus
          },
          requireAuth: true);

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
