part of 'location_cubit.dart';

class LocationState extends Equatable {
  final double? latitude;
  final double? longitude;
  final String? address;
  final bool isLoading;

  const LocationState({
    this.latitude,
    this.longitude,
    this.address,
    this.isLoading = false,
  });

  bool get hasLocation => latitude != null && longitude != null;

  LocationState copyWith({
    double? latitude,
    double? longitude,
    String? address,
    bool? isLoading,
  }) {
    return LocationState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      address: address ?? this.address,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [latitude, longitude, address, isLoading];
}
