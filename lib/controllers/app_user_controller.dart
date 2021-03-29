import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';

enum UserTypeState { Initial, Loading, Loaded }

class AppUserController with ChangeNotifier {
  UserObject _userObject;
  USERTYPE _userType;

  UserTypeState userTypeState = UserTypeState.Initial;

  get userObject => this._userObject;

  setUserObject(value) {
    this._userObject = value;
    notifyListeners();
  }

  get userType => this._userType;

  setUsertype(value) {
    this._userType = value;
    notifyListeners();
  }

  setUserTypeState(value) {
    userTypeState = value;
    print('state value is $value');
    notifyListeners();
  }
}
