import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class OSRMService {
  static Future<List<LatLng>> getDirections(LatLng origin, LatLng destination) async {
    final String url =
        'https://router.project-osrm.org/route/v1/driving/'
        '${origin.longitude},${origin.latitude};'
        '${destination.longitude},${destination.latitude}'
        '?overview=full&geometries=geojson';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['routes'].isNotEmpty) {
          final coordinates = data['routes'][0]['geometry']['coordinates'] as List;
          return coordinates
              .map((coord) => LatLng(coord[1].toDouble(), coord[0].toDouble()))
              .toList();
        }
      } else {
        debugPrint('Rota alma hatası: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Rota alma sırasında hata: $e');
    }
    return [];
  }
} 