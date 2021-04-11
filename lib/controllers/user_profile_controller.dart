import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/models/user_post.dart';
import 'package:food_insta/models/post_request.dart';
import 'package:food_insta/models/user_order.dart';
import 'package:food_insta/repository/user_profile_repo.dart';

enum UserTypeState { Initial, Loading, Loaded }

class UserProfileController with ChangeNotifier {
  final UserProfileRepository userProfileRepo;

  UserObject _userObject = UserObject();

  UserTypeState userTypeState = UserTypeState.Initial;

  UserProfileController(this.userProfileRepo);

  UserObject get userObject => this._userObject;

  void setUserObject(value) {
    this._userObject = value;
    notifyListeners();
  }

  setUserTypeState(value) {
    userTypeState = value;
    notifyListeners();
  }

  Future<void> loadUserProfile() async {
    _userObject = await userProfileRepo.getUserProfile();
    notifyListeners();
  }

  Future<UserObject> getProfileWithId(String id) async {
    UserObject userObject = await userProfileRepo.getUserProfileWithId(id);
    return userObject;
  }

  Future<List<UserPost>> getUserPosts() async {
    print('getUserPosts called');
    var list = await userProfileRepo.getUserPostsList();
    return list;
  }

  Future<List<PostRequest>> getPostRequests(String id) async {
    var list = await userProfileRepo.getPostRequestsList(id);
    return list;
  }

  Future<List<UserOrder>> getUserOrders() async {
    var list = await userProfileRepo.getUserOrdersList();
    return list;
  }
}
