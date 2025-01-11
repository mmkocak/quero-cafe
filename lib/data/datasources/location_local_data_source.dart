import 'package:quero_cafe/data/models/location_model.dart';

class LocationLocalDataSource {
  Future<LocationModel> getCurrentLocation() {
    throw UnimplementedError();
  }

  Future<LocationModel> updateLocation(LocationModel location) {
    throw UnimplementedError();
  }

  Future<void> clearLocation() {
    throw UnimplementedError();
  }
}
