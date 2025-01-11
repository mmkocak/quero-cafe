class LocationException implements Exception {
  final String? message;
  LocationException([this.message]);
}

class NetworkException implements Exception {
  final String? message;
  NetworkException([this.message]);
}

class PermissionException implements Exception {
  final String? message;
  PermissionException([this.message]);
}
