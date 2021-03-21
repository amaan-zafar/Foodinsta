import 'package:flutter/foundation.dart';

class User {
  int id;
  String name;
  int memberType;
  String phoneNumber;
  String countryCode;
  String token;
  String handle;
  String birthDate;
  String gender;
  String email;
  DateTime lastVerifiedAt;
  DateTime tosAgreedAt;
  DateTime ppAgreedAt;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    this.id,
    this.name,
    this.memberType,
    this.phoneNumber,
    this.countryCode,
    this.token,
    this.handle,
    this.birthDate,
    this.gender,
    this.email,
    this.lastVerifiedAt,
    this.tosAgreedAt,
    this.ppAgreedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print('User json $json');
    if (json == null) {
      return null;
    }

    try {
      return User(
        id: json["id"],
        token: json["token"],
        birthDate: json["birthDate"],
        countryCode: json["countryCode"],
        createdAt: json["createdAt"],
        gender: json["gender"],
        handle: json["handle"],
//      lastVerifiedAt: json["lastVerifiedAt"],
        phoneNumber: json["phoneNumber"],
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, phoneNumber: $phoneNumber, countryCode: $countryCode, token: $token, handle: $handle, birthDate: $birthDate, gender: $gender, lastVerifiedAt: $lastVerifiedAt, tosAgreedAt: $tosAgreedAt, ppAgreedAt: $ppAgreedAt, createdAt: $createdAt, updatedAt: $updatedAt,}';
  }
}

class UserNotifier with ChangeNotifier {
  User user = User();

  onNewUser(User newUser) {
    this.user = newUser;
    //  notifyListeners();
  }

  User get getUser {
    return user;
  }

  void updateName(String newName) {
    user.name = newName;
    notifyListeners();
  }

  void updateGender(String newGender) {
    user.gender = newGender;
    notifyListeners();
  }

  void updateBirthdate(String newBirthDate) {
    user.birthDate = newBirthDate;
    notifyListeners();
  }
}
