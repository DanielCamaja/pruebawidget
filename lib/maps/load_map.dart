import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LoadMap extends StatefulWidget {
  const LoadMap({super.key});

  @override
  State<LoadMap> createState() => _LoadMapState();
}

class _LoadMapState extends State<LoadMap> {
  final Completer<GoogleMapController> _mapcontroller = Completer();
//final _myLocation = LatLng(14.613528, -90.516448);
  static const CameraPosition _center =
      CameraPosition(target: LatLng(14.613528, -90.516448), zoom: 14);

  final List<Marker> _marker = [];
  final List<Marker> _branch = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(14.6054876, -90.5266062),
      infoWindow: InfoWindow(title: "hola1"),
    ),
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(14.6100958, -90.5221471),
      infoWindow: InfoWindow(title: "hola2"),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_branch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _mapcontroller.complete(controller);
        },
        initialCameraPosition: _center,
      ),
    );
  }
}
