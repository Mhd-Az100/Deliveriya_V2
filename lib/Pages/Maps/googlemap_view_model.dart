import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  Rx<LatLng> positionMarker = const LatLng(0, 0).obs;
  var sizeMarker = 50.0.obs;
}
