import 'package:flutter/cupertino.dart';
import 'package:food_insta/repository/location_repo.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';

enum CurrentLocationStatus { Initial, Loading, Loaded }
enum CityCoordinatesStatus { Initial, Loading, Loaded }

class LocationController with ChangeNotifier {
  final locationRepository = LocationRepository();
  Position currentLocation;
  Address firstAddress;
  CurrentLocationStatus loadingStatus = CurrentLocationStatus.Initial;
  Map map;
  CityCoordinatesStatus coordinatesStatus = CityCoordinatesStatus.Initial;

  setCurrentLocation() async {
    loadingStatus = CurrentLocationStatus.Loading;
    notifyListeners();
    currentLocation = await locationRepository.getCurrentLocation();
    print('current location is $currentLocation');
    firstAddress = await locationRepository.getAddress(
        currentLocation.latitude, currentLocation.longitude);
    print('addresss is ${firstAddress.subLocality}');
    loadingStatus = CurrentLocationStatus.Loaded;
    notifyListeners();
  }

  getCityCoordinates(String city) async {
    coordinatesStatus = CityCoordinatesStatus.Loading;
    notifyListeners();
    map = await locationRepository.getCoordinatesFromCity(city);
    print('Coordinates are $map');

    coordinatesStatus = CityCoordinatesStatus.Loaded;
    notifyListeners();
  }
}
