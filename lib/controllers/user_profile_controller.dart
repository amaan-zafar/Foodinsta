import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';
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
}
