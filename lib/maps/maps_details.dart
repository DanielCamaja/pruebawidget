import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:pruebawidget/LoginPhone/LoginPhone.dart';
import 'package:http/http.dart' as http;

class CustomInfoWindowExample extends StatefulWidget {
  @override
  _CustomInfoWindowExampleState createState() =>
      _CustomInfoWindowExampleState();
}

class _CustomInfoWindowExampleState extends State<CustomInfoWindowExample> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  var user = GetStorage().read('user') ?? {};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final LatLng _latLng = LatLng(28.7041, 77.1025);
  final double _zoom = 15.0;

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
    // Escuchar eventos de notificación abierta
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Notificación abierta: ${message.notification!.body}');
      // Ejecuta la lógica que necesites en tu aplicación
    });
  }

  @override
  void initState() {
    super.initState();
    print("probemos que trae $user");
  }

  Future sendNotification(String fcmToken) async {
    final String serverKey =
        'AAAApDpbnok:APA91bG7vW5s_VLdjzEAYdkdf1KpezGj5iRn5xl0HUAlFlAOLerkxWzL1vNhBJfzmwktITm_XZ8MErmqmFwU12Rbd9UOYX9qbeONXndQarJ1RtmYbtccp_M6OMjdAIvSM30FmmvgUwZQTOj6OAZMqzA5cgkjAD005g';
    final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'key=$serverKey',
    };

    final data = <String, dynamic>{
      'notification': <String, dynamic>{
        'body': 'Notificación de prueba',
        'title': 'Título de prueba',
        'sound': 'default',
        'badge': '1',
      },
      'priority': 'high',
      'data': <String, dynamic>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'id': '1',
        'status': 'done'
      },
      'to': fcmToken,
    };

    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Notificación enviada con éxito.');
    } else {
      print('Error al enviar la notificación: ${response.statusCode}');
    }
  }

  // Future<void> _sendNotification(String receiverToken) async {
  //   try {
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'AAAApDpbnok:APA91bG7vW5s_VLdjzEAYdkdf1KpezGj5iRn5xl0HUAlFlAOLerkxWzL1vNhBJfzmwktITm_XZ8MErmqmFwU12Rbd9UOYX9qbeONXndQarJ1RtmYbtccp_M6OMjdAIvSM30FmmvgUwZQTOj6OAZMqzA5cgkjAD005g', // Reemplaza API_KEY con tu clave de API de Firebase
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': '¡Hola! Tienes una nueva notificación',
  //             'title': 'Notificación',
  //             'sound': 'default',
  //             'badge': '1',
  //           },
  //           'data': <String, dynamic>{
  //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //             'id': '1',
  //             'status': 'done'
  //           },
  //           'to': receiverToken,
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error al enviar la notificación: $e');
  //   }
  // }

  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId("marker_id"),
        position: _latLng,
        onTap: () {
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
            _latLng,
          );
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                sendNotification(
                    "cC98TbPORfenqr-QayEgNl:APA91bGhnu-G4d2g-OvWRXbfcv3R4QOXjHDgYrYnlLaNadhsLWxhVhCBHqivyYuY5WK7FYSxXyzHQ4GHUPVUh2eEuTUf76tCIB_af2OS94GWMFK1Qv8VhXBwRDnbVeydgnWyd67sjFPR");
                // _sendNotification(
                //     'cC98TbPORfenqr-QayEgNl:APA91bGhnu-G4d2g-OvWRXbfcv3R4QOXjHDgYrYnlLaNadhsLWxhVhCBHqivyYuY5WK7FYSxXyzHQ4GHUPVUh2eEuTUf76tCIB_af2OS94GWMFK1Qv8VhXBwRDnbVeydgnWyd67sjFPR');
              },
              icon: Icon(Icons.send))
        ],
        leading: IconButton(
            onPressed: () async {
              await GetStorage().remove('user');
              await FirebaseAuth.instance.signOut();
              await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyPhone()));
            },
            icon: Icon(Icons.power_settings_new)),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) async {
              _customInfoWindowController.googleMapController = controller;
            },
            markers: _markers,
            initialCameraPosition: CameraPosition(
              target: _latLng,
              zoom: _zoom,
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 175,
            width: 160,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
