import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LiveMaps extends StatefulWidget {
  const LiveMaps({super.key});

  @override
  State<LiveMaps> createState() => _LiveMapsState();
}

class _LiveMapsState extends State<LiveMaps> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _customInfoWindowController.dispose();
  }

  void _getLocation() async {
    LocationData? locationData;
    var location = Location();
    try {
      locationData = await location.getLocation();
    } catch (e) {
      locationData = null;
    }
    if (locationData != null) {
      _updateMarker(locationData.latitude!, locationData.longitude!);
    }
  }

  void _updateMarker(double lat, double lng) {
    setState(() {
      _markers.clear();
      _markers.add(Marker(
          markerId: MarkerId('my_location'),
          position: LatLng(-34.6158238, -58.4332985),
          //icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
/*
            _customInfoWindowController.addInfoWindow!(
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1566837/pexels-photo-1566837.jpeg?cs=srgb&dl=pexels-narda-yescas-1566837.jpg&fm=jpg'),
                            fit: BoxFit.fitWidth,
                            filterQuality: FilterQuality.high),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Beef Tacos',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '.3 mi.',
                            // widget.data!.date!,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Text(
                        'Help me finish these tacos! I got a platter from Costco and it’s too much.',
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              LatLng(-34.6158238, -58.4332985),
            );
            */
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-34.6147741, -58.4829567), // San Francisco
          zoom: 15,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
