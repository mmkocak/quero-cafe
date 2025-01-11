import 'package:location/location.dart';
import 'package:quero_cafe/core/error/exceptions.dart';
import 'package:quero_cafe/data/models/location_model.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationLocalDataSource {
  Future<LocationModel> getCurrentLocation();
  Future<LocationModel> updateLocation(LocationModel location);
  Future<void> clearLocation();
}

class LocationLocalDataSourceImpl implements LocationLocalDataSource {
  final Location location;

  LocationLocalDataSourceImpl({required this.location});

  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      final locationData = await location.getLocation();
      if (locationData.latitude == null || locationData.longitude == null) {
        throw LocationException('Could not get location data');
      }
      
      return LocationModel(
        coordinates: LatLng(locationData.latitude!, locationData.longitude!),
      );
    } catch (e) {
      throw LocationException(e.toString());
    }
  }

  @override
  Future<LocationModel> updateLocation(LocationModel location) async {
    // Here you might want to save the location to local storage
    return location;
  }

  @override
  Future<void> clearLocation() async {
    // Here you might want to clear the location from local storage
  }
}
