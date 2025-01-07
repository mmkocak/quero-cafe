import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

mixin LocationListenerMixin {
  void setupLocationListener({
    required Location location,
    required Function(LatLng) onLocationChanged,
  }) {
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        final newLocation = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );
        onLocationChanged(newLocation);
      }
    });
  }
} 