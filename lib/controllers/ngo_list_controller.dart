import 'package:flutter/material.dart';
import 'package:food_insta/repository/ngo_list_repo.dart';

enum NgoListControllerState { Initial, Loading, Loaded }

class NgoListController with ChangeNotifier {
  final NgoListRepository ngoListRepository;
  NgoListControllerState ngoListControllerState =
      NgoListControllerState.Initial;

  NgoListController(this.ngoListRepository);

  Future<List<Ngo>> getNgoList() async {
    // ngoListControllerState = NgoListControllerState.Loading;
    // notifyListeners();
    return await ngoListRepository.getNgoList();
    // ngoListControllerState = NgoListControllerState.Loaded;
    // notifyListeners();
  }
}
