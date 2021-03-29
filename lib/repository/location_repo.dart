import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class LocationRepository {
  final googleApiKey = 'AIzaSyDFbXEFzzx7CUhk6CaGdz64KUGVnBZ2FvI';
  var addresses;

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<dynamic> getAddress(double lat, double lng) async {
    final coordinates = Coordinates(lat, lng);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses[0];
  }

  Future<Map<String, double>> getCoordinatesFromCity(String city) async {
    var addresses = await Geocoder.local.findAddressesFromQuery(city);
    var first = addresses.first;
    var map = first.coordinates.toMap();
    print("${first.featureName} : ${first.coordinates}");
    return map;
  }
}
