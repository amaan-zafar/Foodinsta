import 'package:flutter/cupertino.dart';
import 'package:food_insta/repository/location_repo.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

enum LoadingStatus { Initial, Loading, Loaded }

class LocationController with ChangeNotifier {
  final locationRepository = LocationRepository();

  Position currentLocation;
  Address firstAddress;
  LoadingStatus loadingStatus = LoadingStatus.Initial;

  setCurrentLocation() async {
    loadingStatus = LoadingStatus.Loading;
    notifyListeners();
    currentLocation = await locationRepository.getCurrentLocation();
    print('current location is $currentLocation');
    firstAddress = await locationRepository.getAddress(
        currentLocation.latitude, currentLocation.longitude);
    print('addresss is ${firstAddress.subLocality}');
    loadingStatus = LoadingStatus.Loaded;
    notifyListeners();
  }
}
