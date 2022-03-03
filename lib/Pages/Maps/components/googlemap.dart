// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:dilivirya/Pages/Maps/googlemap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  var controller = Get.find<MapController>();

  final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? googleMapController;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.51384684797103, 36.27647725478557),
    zoom: 15,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Position? currentposition;
  void currentlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentposition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 14);
    googleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    currentlocation();

    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
        currentlocation();
      },
      onCameraMove: (CameraPosition position) {
        controller.positionMarker.value = position.target;
        controller.sizeMarker.value = 50;
      },
      onCameraIdle: () async {
        print(controller.positionMarker.value);
        controller.sizeMarker.value = 70;
      },
    );
  }
}
