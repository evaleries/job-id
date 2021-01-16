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
  double latIndo;
  double longIndo;
  LatLng latLngIndo;

  @override
  void initState() {
    super.initState();

    print(widget.data.company.location);
    getCoordinate().then((coordinate) => setState(() {
          latLngIndo = coordinate;
        }));
  }

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<LatLng> getCoordinate() async {
    if (widget.data.company.location['address'] == null) {
      return Future.error('Invalid address');
    }

    final address = widget.data.company.location['address'];
    var addresses = await Geocoder.local.findAddressesFromQuery(address);
    var firstAddr = addresses.first;

    if (firstAddr.coordinates == null) {
      var query =
          '${address.toString().split(',').first}, ${address.locationSubCategory['ind']}';
      var nearby = await Geocoder.local.findAddressesFromQuery(query);
      var firstNearby = nearby.first;
      if (firstNearby.coordinates == null) {
        return LatLng(-4.52063, 122.03462);
      }
      return LatLng(
          firstNearby.coordinates.latitude, firstNearby.coordinates.longitude);
    }

    return LatLng(
        firstAddr.coordinates.latitude, firstAddr.coordinates.longitude);
  }

  @override
  Widget build(BuildContext context) {
    if (latLngIndo != null) {
      return Scaffold(
          body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: latLngIndo,
          zoom: 15.0,
        ),
      ));
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
