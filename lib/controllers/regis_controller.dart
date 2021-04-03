import 'package:flutter/material.dart';
import 'package:food_insta/controllers/app_user_controller.dart';
import 'package:food_insta/repository/registration_repo.dart';
import 'package:food_insta/models/user.dart';
import 'package:provider/provider.dart';

enum RegistrationState { Initial, Loading, Loaded }

class RegisController with ChangeNotifier {
  final RegistrationRepository registrationRepository;
  AppUserController controller;
  RegistrationState registrationState = RegistrationState.Initial;

  RegisController(this.registrationRepository);

  Future<void> register(UserObject obj, BuildContext context) async {
    registrationState = RegistrationState.Loading;
    notifyListeners();
    await registrationRepository.registerUser(obj);
    Provider.of<AppUserController>(context, listen: false).setUserObject(obj);
    registrationState = RegistrationState.Loaded;
    notifyListeners();
  }
}
