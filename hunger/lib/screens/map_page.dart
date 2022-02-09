import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hunger/screens/deliver_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPage extends StatefulWidget {
  @override
  State createState() {
    return MapPageState();
  }
}

class MapPageState extends State {
  LatLng latlong = LatLng(0, 0);
  late CameraPosition _cameraPosition;
  late GoogleMapController _controller;
  Set<Marker> _markers = {};
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _cameraPosition = CameraPosition(
        target: LatLng(0, 0),
        zoom: 19.151926040649414,
        tilt: 59.440717697143555);
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
        children: [
          (latlong != null)
              ? GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _cameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller = (controller);
                    _controller.animateCamera(
                        CameraUpdate.newCameraPosition(_cameraPosition));
                  },
                  markers: _markers,
                )
              : Container(),
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                style: TextStyle(fontFamily: 'roboto', fontSize: 15),
                cursorColor: Colors.black,
                controller: locationController,
                decoration: InputDecoration(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    width: 10,
                    height: 10,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.green,
                    ),
                  ),
                  hintText: "your location",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.0,
            right: 100.0,
            left: 100.0,
            child: Container(
                height: 45,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DeliverScreen(
                                  location: locationController.text.isNotEmpty
                                      ? locationController.text
                                      : "")));
                    },
                    child: const Text(
                      'Proceed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'roboto',
                        fontWeight: FontWeight.bold,
                      ),
                    ))),
          ),
          Positioned(
            top: 110.0,
            right: 20.0,
            child: Container(
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue,
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      getChangedLocation(locationController.text);
                    },
                    child: FittedBox(
                      child: Icon(Icons.search),
                      fit: BoxFit.contain,
                    ))),
          ),
        ],
      )),
    );
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != PermissionStatus.granted) {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission != PermissionStatus.granted) getLocation();
      return;
    }
    getLocation();
  }

  getChangedLocation(String changedLocation) async {
    List<Location> locations = await locationFromAddress(changedLocation);
    var location = locations[0];

    setState(() {
      latlong = LatLng(location.latitude, location.longitude);
      _cameraPosition = CameraPosition(
          target: latlong, zoom: 14.151926040649414, tilt: 59.440717697143555);
      if (_controller != null) {
        _controller
            .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
      }

      _markers.clear();

      _markers.add(Marker(
          markerId: const MarkerId("currentLocation"),
          draggable: true,
          position: latlong,
          icon: BitmapDescriptor.defaultMarker,
          onDragEnd: (_currentlatLng) {
            setState(() {
              latlong = _currentlatLng;
            });
            //latlong = _currentlatLng;
          }));
    });
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latlong = LatLng(position.latitude, position.longitude);
      _cameraPosition = CameraPosition(
          target: latlong, zoom: 14.151926040649414, tilt: 59.440717697143555);
      if (_controller != null) {
        _controller
            .animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
      }

      _markers.add(Marker(
          markerId: const MarkerId("currentLocation"),
          draggable: true,
          position: latlong,
          icon: BitmapDescriptor.defaultMarker,
          onDragEnd: (_currentlatLng) {
            setState(() {
              latlong = _currentlatLng;
            });
            //latlong = _currentlatLng;
          }));
    });

    getCurrentAddress(latlong);
  }

  getCurrentAddress(LatLng latlong) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latlong.latitude, latlong.longitude);
    Placemark place = placemarks[0];
    if (place != null) {
      var address;
      address = place.street;
      address = "$address, ${place.subLocality}";
      address = "$address, ${place.locality}";
      address = "$address, ${place.country}";
      address = "$address, ${place.postalCode}";

      locationController.text = address;
    }
  }
}
