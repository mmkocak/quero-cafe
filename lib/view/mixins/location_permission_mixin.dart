import 'package:location/location.dart';

mixin LocationPermissionMixin {
  final Location location = Location();

  Future<bool> checkAndRequestPermissions() async {
    // Konum servisi açık mı kontrol et
    final bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final bool serviceStarted = await location.requestService();
      if (!serviceStarted) return false;
    }

    // Konum izni var mı kontrol et
    final PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      final PermissionStatus permissionRequested = await location.requestPermission();
      if (permissionRequested != PermissionStatus.granted) return false;
    }

    return true;
  }
} 