import 'package:flutter/services.dart';
import 'package:food_insta/utils/CustomHttpClient.dart';
import 'package:food_insta/utils/Failure.dart';
import 'package:food_insta/utils/authentication.dart';

class NgoListRepository {
  final CustomHttpClient _customHttpClient;

  NgoListRepository(
    this._customHttpClient,
  );

  Future<List<Ngo>> getNgoList() async {
    Iterable response;
    try {
      response = await _customHttpClient.getRequest('users/ngo_list',
          requireAuth: true) as List;

      List<Ngo> ngoList = response.map((i) => Ngo.fromJson(i)).toList();
      return ngoList;
    } on PlatformException catch (error) {
      if (error.code == 'network_error')
        throw Failure('Not connected to internet');
      return null;
    } catch (unexpectedError) {
      print("UNEXPECTED ERROR OCCURED: ${unexpectedError.toString()}");
      await Authentication.signOut();
      return null;
    }
  }
}

class Ngo {
  String name;
  String staticId;

  Ngo({this.name, this.staticId});

  factory Ngo.fromJson(Map<dynamic, dynamic> json) {
    return Ngo(name: json['name'], staticId: json['static_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['static_id'] = this.staticId;
    return data;
  }
}
