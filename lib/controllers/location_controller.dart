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
  Map map;
  String citySelected;
  CurrentLocationStatus loadingStatus = CurrentLocationStatus.Initial;
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

  // Future<Address> getAddressFromCoordinates(double lat, double lng) async {
  //   Address address = await locationRepository.getAddress(lat, lng);
  //   return address;
  // }

  Future<Map> getCityCoordinates(String city) async {
    citySelected = city;
    coordinatesStatus = CityCoordinatesStatus.Loading;
    notifyListeners();
    map = await locationRepository.getCoordinatesFromCity(city);
    print('Coordinates are $map');
    coordinatesStatus = CityCoordinatesStatus.Loaded;
    notifyListeners();
    return map;
  }
}
