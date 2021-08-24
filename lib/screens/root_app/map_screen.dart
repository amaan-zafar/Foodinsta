import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_insta/components/custom_app_bar.dart';
import 'package:food_insta/components/rating_indicator.dart';
import 'package:food_insta/components/user_type_label.dart';
import 'package:food_insta/controllers/post_controller.dart';
import 'package:food_insta/models/create_post.dart';
import 'package:food_insta/models/feed_post.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:jiffy/jiffy.dart';
import 'home/home_page.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<FeedPost> feedPosts;
  String city = getSelectedCity();

  Set<Marker> markers = {};
  getMarkers() {
    for (int i = 0; i < postJson.length; i++) {
      markers.add(Marker(
          markerId: MarkerId('$i'),
          // TODO : Replace with backend data
          position: LatLng(postJson[i]['lat'], postJson[i]['lng']),
          infoWindow: InfoWindow(title: postJson[i]['name']),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure)));
    }
    return markers;
  }

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;
  static const LatLng _center = const LatLng(28.644800, 77.216721);
  @override
  Widget build(BuildContext context) {
    markers = getMarkers();
    return Column(
      children: [
        CustomAppBar(
          centerTitle: true,
        ),
        Expanded(
          child: Stack(
            children: [
              _buildGoogleMap(),
              _buildMapInfoContainer(),
            ],
          ),
        )
      ],
    );
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Widget _buildMapInfoContainer() {
    PostController postController = Provider.of<PostController>(context);

    return Align(
      alignment: Alignment.bottomLeft,
      child: FutureBuilder(
        future: postController.getFeedPosts(city),
        builder: (context, snapshot) {
          print("Snapshot is: " + snapshot.toString());
          if (snapshot.connectionState == ConnectionState.none)
            return Container(
              child: Center(
                child: Text('Check your internet connection'),
              ),
            );
          else if (snapshot.connectionState == ConnectionState.waiting)
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          else {
            feedPosts = snapshot.data;
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else if (feedPosts?.isEmpty ?? true)
              return Container(
                child: Center(
                  child: Text('No post available in this city'),
                ),
              );
            else {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 32),
                height: 150.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: feedPosts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _boxes(
                            // TODO : Replace with backend data
                            feedPosts[index].product.prodImg,
                            postJson[index]['lat'], //TODO harcoded lat and long
                            postJson[index]['lng'],
                            feedPosts[index].authorName,
                            index),
                      );
                    }),
              );
            }
          }
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete((controller));
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
      mapType: _currentMapType,
      markers: markers,
      onCameraMove: _onCameraMove,
    );
  }

  Future<void> _goToLocation(double lat, double lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, lng), zoom: 15, bearing: 45.0, tilt: 50.0)));
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
                  width: 240,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: _image == null
                          ? AssetImage('assets/placeholder_img.png')
                          : NetworkImage(_image),
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
    // TODO : Replace postJson with backend data
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
          rating: 2.5, // TODO hardcoded rating
          itemSize: 20,
        )),
        SizedBox(height: 5.0),
        UserTypeLabel(
          label: feedPosts[index].authorType,
          horizontalPadding: 28,
        ),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "${feedPosts[index].product.weight} \u00B7 " +
              Jiffy(feedPosts[index].createdAt, "dd-MM-yyyy hh:mm:ss")
                  .fromNow(),
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "${feedPosts[index].numOfRequests.toString()} pending requests",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }
}
