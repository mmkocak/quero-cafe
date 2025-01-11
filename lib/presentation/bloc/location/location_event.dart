import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetCurrentLocationEvent extends LocationEvent {}

class UpdateLocationEvent extends LocationEvent {
  final LatLng coordinates;
  final bool isManualSelection;

  const UpdateLocationEvent({
    required this.coordinates,
    this.isManualSelection = false,
  });

  @override
  List<Object?> get props => [coordinates, isManualSelection];
}

class ClearLocationEvent extends LocationEvent {}
