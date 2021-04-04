import 'package:flutter/material.dart';
import 'package:food_insta/models/user.dart';
import 'package:food_insta/repository/auth_repo.dart';
import 'package:food_insta/controllers/user_profile_controller.dart';

import 'package:provider/provider.dart';

enum LoginState { Initial, Loading, Loaded }

class LoginController with ChangeNotifier {
  final AuthRepository authRepository;
  LoginState loginState = LoginState.Initial;
  Map<String, dynamic> map;
  int status = 1;
  String email;

  LoginController(this.authRepository);

  Future<String> loginWithGoogle() async {
    loginState = LoginState.Loading;
    notifyListeners();
    map = await authRepository.signInWithGoogle();
    status = map['status'];
    email = map['email'];
    if (status == 1) {}
    loginState = LoginState.Loaded;
    notifyListeners();
    return email;
  }
}
