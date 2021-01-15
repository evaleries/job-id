import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:jobid/models/job.dart';

class MapBody extends StatefulWidget {
  final Job data;

  const MapBody({Key key, this.data}) : super(key: key);

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  Completer<GoogleMapController> _controller = Completer();

  LatLng _center = LatLng(-4.52063, 122.03462);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  getCoordinate() async {
    print(widget.data.company.location['address']);
    if (widget.data.company.location['address'] == null) {
      return false;
    }

    final address = widget.data.company.location['address'];
    var addresses = await Geocoder.local.findAddressesFromQuery(address);
    var firstAddr = addresses.first;
    print(firstAddr);
    print(firstAddr.coordinates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getCoordinate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
        }
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: snapshot.hasData ? '' : _center,
          ),
        );
      },
    ));
  }
}
