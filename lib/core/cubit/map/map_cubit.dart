import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:quero_cafe/services/osrm_service.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(
    const MapState(cafeLocation: LatLng(39.0297, 43.3506))
  );
  bool _isAutoLocationEnabled = true;

  void updateUserLocation(LatLng location, {bool isManualSelection = false}) async {
    if (isManualSelection) {
      _isAutoLocationEnabled = false;
    }

    if (!_isAutoLocationEnabled && !isManualSelection) {
      return; // Otomatik güncellemeyi engelle
    }

    final markers = _createMarkers(state.cafeLocation, location);
    final routePoints = await OSRMService.getDirections(location, state.cafeLocation);
    
    emit(state.copyWith(
      userLocation: location,
      markers: markers,
      routePoints: routePoints,
    ));
  }

  void clearUserLocation() {
    _isAutoLocationEnabled = true;
    emit(state.copyWith(
      userLocation: null,
      markers: _createMarkers(state.cafeLocation, null),
      routePoints: [],
    ));
  }

  List<Marker> _createMarkers(LatLng cafeLocation, LatLng? userLocation) {
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
            color: Color(0xFFB17445),
            size: 40,
          ),
        ),
      );
    }

    return markers;
  }
} 