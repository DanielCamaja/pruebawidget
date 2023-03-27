import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController mapController;

//   //Completer<GoogleMapController> mapController = Completer();
//   //final Completer<GoogleMapController> mapController = Completer();

//   List<dynamic> markers = [];

//   @override
//   void initState() {
//     super.initState();
//     getMarkers1().then((data) {
//       setState(() {
//         markers = data;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Mapa'),
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: LatLng(37.77483, -122.41942),
//           zoom: 12.0,
//         ),
//         markers: markers.map((marker) {
//           return Marker(
//             markerId: MarkerId(marker['email']),
//             position: LatLng(double.tryParse(marker["latitud"]) ?? 0.0,
//                 double.tryParse(marker["longitud"]) ?? 0.0),
//             infoWindow: InfoWindow(title: marker['email']),
//           );
//         }).toSet(),
//       ),
//     );
//   }

//   Future<List<dynamic>> getMarkers1() async {
//     String url = 'http://172.20.1.244:3000/api/users/yoparqueoveo';
//     http.Response response = await http.get(Uri.parse(url));

//     if (response.statusCode == 201) {
//       List<dynamic> data = json.decode(response.body);
//       return data;
//     } else {
//       throw Exception(
//           'Failed load data with status code ${response.statusCode}');
//     }
//   }
// }

import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
      print("AAAAAAAAAAAAAAAAAAAAAAA${_currentPosition}");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentPosition == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          zoom: 15,
        ),
        // ...
      );
    }
  }
}
