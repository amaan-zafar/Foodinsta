import 'package:flutter/material.dart';
import 'package:food_insta/repository/auth_repo.dart';

enum LoginState { Initial, Loading, Loaded }

class LoginController with ChangeNotifier {
  final AuthRepository authRepository;
  LoginState loginState = LoginState.Initial;
  int status = 1;

  LoginController(this.authRepository) {}

  Future<void> loginWithGoogle() async {
    loginState = LoginState.Loading;
    notifyListeners();
    status = await authRepository.signInWithGoogle();
    loginState = LoginState.Loaded;
    notifyListeners();
  }
}
