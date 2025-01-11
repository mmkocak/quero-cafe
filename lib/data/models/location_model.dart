import 'package:latlong2/latlong.dart';
import 'package:quero_cafe/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required LatLng coordinates,
    String? address,
    bool isManualSelection = false,
  }) : super(
          coordinates: coordinates,
          address: address,
          isManualSelection: isManualSelection,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      coordinates: LatLng(
        json['latitude'] as double,
        json['longitude'] as double,
      ),
      address: json['address'] as String?,
      isManualSelection: json['isManualSelection'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'latitude': coordinates.latitude,
      'longitude': coordinates.longitude,
      'address': address,
      'isManualSelection': isManualSelection,
    };
  }
}
