import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final Location location = Location();
  final LatLng _cafeLocation = const LatLng(39.0297, 43.3506);
  List<Marker> _markers = [];
  List<LatLng> _routePoints = [];
  LatLng? _userLocation;

  @override
  void initState() {
    super.initState();
    _checkPermissionsAndSetup();
    _addCafeMarker();
  }

  // Kullanıcı izinlerini kontrol et
  Future<void> _checkPermissionsAndSetup() async {
    final bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      final bool serviceStarted = await location.requestService();
      if (!serviceStarted) return;
    }

    final PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      final PermissionStatus permissionRequested =
          await location.requestPermission();
      if (permissionRequested != PermissionStatus.granted) return;
    }

    _setupLocationListener();
  }

  // Kafeyi işaretleyen marker ekle
  void _addCafeMarker() {
    _markers.add(
      Marker(
        point: _cafeLocation,
        width: 80,
        height: 80,
        child: const Icon(
          Icons.location_on,
          color: Color(0xFFB17445),
          size: 40,
        ),
      ),
    );
  }

  // OSRM API ile rota al
  Future<void> _getDirections(LatLng origin) async {
    final String url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${origin.longitude},${origin.latitude};'
        '${_cafeLocation.longitude},${_cafeLocation.latitude}'
        '?overview=full&geometries=geojson';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final coordinates =
              data['routes'][0]['geometry']['coordinates'] as List;
          setState(() {
            _routePoints = coordinates
                .map((coord) =>
                    LatLng(coord[1].toDouble(), coord[0].toDouble()))
                .toList();
          });
        }
      } else {
        debugPrint('Rota alma hatası: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Rota alma sırasında hata: $e');
    }
  }

  // Konum değişikliklerini dinle
  void _setupLocationListener() {
    location.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        final LatLng newUserLocation =
            LatLng(currentLocation.latitude!, currentLocation.longitude!);
        setState(() {
          _userLocation = newUserLocation;
          _updateMarkers();
          _getDirections(newUserLocation);
        });
      }
    });
  }

  // Markerları güncelle
  void _updateMarkers() {
    _markers = [
      Marker(
        point: _cafeLocation,
        width: 80,
        height: 80,
        child: const Icon(
          Icons.location_on,
          color: Color(0xFFB17445),
          size: 40,
        ),
      ),
      if (_userLocation != null)
        Marker(
          point: _userLocation!,
          width: 80,
          height: 80,
          child: const Icon(
            Icons.my_location,
            color: Colors.blue,
            size: 40,
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: _cafeLocation,
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.quero_cafe',
          ),
          MarkerLayer(markers: _markers),
          if (_routePoints.isNotEmpty)
            PolylineLayer(
              polylines: [
                Polyline(
                  points: _routePoints,
                  strokeWidth: 4,
                  color: const Color(0xFFB17445),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
