part of 'map_cubit.dart';

class MapState extends Equatable {
  final LatLng cafeLocation;
  final LatLng? userLocation;
  final List<LatLng> routePoints;
  final List<Marker> markers;

  const MapState({
    required this.cafeLocation,
    this.userLocation,
    this.routePoints = const [],
    this.markers = const [],
  });

  @override
  List<Object?> get props => [cafeLocation, userLocation, routePoints, markers];

  MapState copyWith({
    LatLng? cafeLocation,
    LatLng? userLocation,
    List<LatLng>? routePoints,
    List<Marker>? markers,
  }) {
    return MapState(
      cafeLocation: cafeLocation ?? this.cafeLocation,
      userLocation: userLocation,
      routePoints: routePoints ?? this.routePoints,
      markers: markers ?? this.markers,
    );
  }
} 