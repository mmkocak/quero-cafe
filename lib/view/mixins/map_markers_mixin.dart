import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

mixin MapMarkersMixin {
  List<Marker> createMarkers({
    required LatLng cafeLocation,
    LatLng? userLocation,
  }) {
    final markers = <Marker>[
      Marker(
        point: cafeLocation,
        width: 80,
        height: 80,
        child: const Icon(
          Icons.location_on,
          color: Color(0xFFB17445),
          size: 40,
        ),
      ),
    ];

    if (userLocation != null) {
      markers.add(
        Marker(
          point: userLocation,
          width: 80,
          height: 80,
          child: const Icon(
            Icons.my_location,
            color: Colors.blue,
            size: 40,
          ),
        ),
      );
    }

    return markers;
  }
} 