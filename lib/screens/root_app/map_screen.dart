import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/theme.dart' as AppTheme;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {
    Marker(
        markerId: MarkerId('delhi1'),
        position: LatLng(28.744800, 77.116721),
        infoWindow: InfoWindow(title: 'Marker1'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)),
    Marker(
        markerId: MarkerId('delhi2'),
        position: LatLng(28.944800, 77.296721),
        infoWindow: InfoWindow(title: 'Marker2'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)),
    Marker(
        markerId: MarkerId('delhi3'),
        position: LatLng(28.544800, 77.006721),
        infoWindow: InfoWindow(title: 'Marker3'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)),
  };

  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Widget _buildMapInfoContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  28.544800,
                  77.006721,
                  "Blue Hill"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",
                  28.744800,
                  77.116721,
                  "Gramercy Tavern"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                  28.944800,
                  77.296721,
                  "Le Bernardin"),
            ),
          ],
        ),
      ),
    );
  }

  MapType _currentMapType = MapType.normal;
  static const LatLng _center = const LatLng(28.644800, 77.216721);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.iconColor,
        elevation: 0.0,
        title: Center(
          child: Text(Constants.APP_LABEL),
        ),
      ),
      body: Stack(
        children: [
          _buildGoogleMap(),
          // _buildFabs(),
          _buildMapInfoContainer(),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete((controller));
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      mapType: _currentMapType,
      markers: _markers,
      onCameraMove: _onCameraMove,
    );
  }

  Widget _boxes(String _image, double lat, double lng, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _goToLocation(lat, lng);
      },
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(16.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer(restaurantName),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Future<void> _goToLocation(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng))));
  }

  Widget _buildFabs() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            FloatingActionButton(
              onPressed: () => _onMapTypeButtonPressed(),
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.green,
              child: const Icon(Icons.map, size: 36.0),
            ),
            SizedBox(height: 16.0),
            FloatingActionButton(
              onPressed: _onAddMarkerButtonPressed,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add_location, size: 36.0),
            ),
          ],
        ),
      ),
    );
  }
}
