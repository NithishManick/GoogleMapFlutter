import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GMap extends StatefulWidget {
  const GMap({Key? key}) : super(key: key);

  @override
  State<GMap> createState() => _GMapState();
}

class _GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _home = CameraPosition(
    target: LatLng(11.1271, 78.6569),
    zoom: 5,
  );

  List<Marker> _marker = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.add(Marker(
      markerId: MarkerId("MyHome"),
      draggable: true,
      position: LatLng(11.1271, 78.6569),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("GOOGLE MAP"),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        markers: Set.from(_marker),
        initialCameraPosition: _home,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      //
    );
  }
}
