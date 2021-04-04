import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';

enum UserTypeState { Initial, Loading, Loaded }

class UserProfileController with ChangeNotifier {
  UserObject _userObject = UserObject();

  UserTypeState userTypeState = UserTypeState.Initial;

  UserObject get userObject => this._userObject;

  void setUserObject(value) {
    this._userObject = value;
    notifyListeners();
  }

  setUserTypeState(value) {
    userTypeState = value;
    notifyListeners();
  }
}
