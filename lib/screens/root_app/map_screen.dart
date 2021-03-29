import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/constants.dart' as Constants;
import 'package:food_insta/models/post.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
        margin: const EdgeInsets.symmetric(vertical: 32),
        height: 150.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: postJson.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                    28.544800,
                    77.006721,
                    postJson[index]['name'],
                    index),
              );
            }),
      ),
    );
  }

  MapType _currentMapType = MapType.normal;
  static const LatLng _center = const LatLng(28.644800, 77.216721);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          centerTitle: true,
        ),
        Expanded(
          child: Stack(
            children: [
              _buildGoogleMap(),
              // _buildFabs(),
              _buildMapInfoContainer(),
            ],
          ),
        )
      ],
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete((controller));
  }

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  // void _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       // This marker id can be anything that uniquely identifies each marker.
  //       markerId: MarkerId(_lastMapPosition.toString()),
  //       position: _lastMapPosition,
  //       infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '5 Star Rating',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }

  Widget _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      mapType: _currentMapType,
      markers: _markers,
      onCameraMove: _onCameraMove,
    );
  }

  Future<void> _goToLocation(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, lng), zoom: 18, bearing: 45.0, tilt: 50.0)));
  }

  Widget _boxes(
      String _image, double lat, double lng, String restaurantName, int index) {
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
                    child: myDetailsContainer(restaurantName, index),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer(String restaurantName, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Color(0xff6200ee),
                fontSize: 28.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 2.0),
        Container(
            child: RatingIndicator(
          rating: postJson[index]['rating'],
          itemSize: 20,
        )),
        SizedBox(height: 5.0),
        UserTypeLabel(
          label: postJson[index]['member_type'],
          horizontalPadding: 28,
        ),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "${postJson[index]['weight']} \u00B7 ${postJson[index]['time']}",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "${postJson[index]['num_of_requests'].toString()} pending requests",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  // Widget _buildFabs() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Align(
  //       alignment: Alignment.topRight,
  //       child: Column(
  //         children: [
  //           FloatingActionButton(
  //             onPressed: () => _onMapTypeButtonPressed(),
  //             materialTapTargetSize: MaterialTapTargetSize.padded,
  //             backgroundColor: Colors.green,
  //             child: const Icon(Icons.map, size: 36.0),
  //           ),
  //           SizedBox(height: 16.0),
  //           FloatingActionButton(
  //             onPressed: _onAddMarkerButtonPressed,
  //             materialTapTargetSize: MaterialTapTargetSize.padded,
  //             backgroundColor: Colors.green,
  //             child: const Icon(Icons.add_location, size: 36.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
