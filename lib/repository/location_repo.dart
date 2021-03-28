import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
// import 'package:http/http.dart' as http;
// import 'package:food_insta/models/google_api/places_search.dart';

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

  // Future<List<PlaceSearch>> getAutoComplete(String search) async {
  //   var url = "";
  //   var response = await http.get(Uri.parse(url));
  //   var json = jsonDecode(response.body);
  //   var jsonResults = json['predictions'] as List;
  //   return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  // }
}
