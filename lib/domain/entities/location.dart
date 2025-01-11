import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class Location extends Equatable {
  final LatLng coordinates;
  final String? address;
  final bool isManualSelection;

  const Location({
    required this.coordinates,
    this.address,
    this.isManualSelection = false,
  });

  @override
  List<Object?> get props => [coordinates, address, isManualSelection];
}
