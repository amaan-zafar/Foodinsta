import 'package:flutter/material.dart';
import 'package:food_insta/repository/registration_repo.dart';

enum RegistrationState { Initial, Loading, Loaded }

class RegisController with ChangeNotifier {
  final RegistrationRepository registrationRepository;
  RegistrationState registrationState = RegistrationState.Initial;

  RegisController(this.registrationRepository);

  Future<void> register(UserObject obj, USERTYPE type) async {
    registrationState = RegistrationState.Loading;
    notifyListeners();
    await registrationRepository.registerUser(obj, type);
    registrationState = RegistrationState.Loaded;
    notifyListeners();
  }
}
