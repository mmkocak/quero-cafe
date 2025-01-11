import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/navigation/navigation_cubit.dart';
import 'package:flutter/services.dart';
import 'package:quero_cafe/view/mixins/location_permission_mixin.dart';

import 'package:quero_cafe/view/widgets/map_bottom_info.dart';
import 'package:quero_cafe/core/cubit/map/map_cubit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with LocationPermissionMixin {
  final MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    final hasPermission = await checkAndRequestPermissions();
    if (hasPermission) {
      location.onLocationChanged.listen((locationData) {
        if (!mounted) return;
        if (locationData.latitude != null && locationData.longitude != null) {
          context.read<MapCubit>().updateUserLocation(
                LatLng(locationData.latitude!, locationData.longitude!),
              );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.white.withAlpha(0),
            elevation: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            leading: Container(
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.black),
                  onPressed: () => context.read<MapCubit>().clearUserLocation(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.my_location, color: Colors.black),
                  onPressed: () async {
                    if (state.userLocation != null) {
                      _mapController.move(state.userLocation!, 15);
                    } else {
                      final locationData = await location.getLocation();
                      if (locationData.latitude != null &&
                          locationData.longitude != null) {
                        _mapController.move(
                          LatLng(
                              locationData.latitude!, locationData.longitude!),
                          15,
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: state.cafeLocation,
                  initialZoom: 15,
                  onTap: (_, point) {
                    context
                        .read<MapCubit>()
                        .updateUserLocation(point, isManualSelection: true);
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.quero_cafe',
                  ),
                  MarkerLayer(markers: state.markers),
                  if (state.routePoints.isNotEmpty)
                    PolylineLayer(
                      polylines: [
                        Polyline(
                          points: state.routePoints,
                          strokeWidth: 4,
                          color: const Color(0xFFB17445),
                        ),
                      ],
                    ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: MapBottomInfo(
                  userLocation: state.userLocation,
                  destinationName: 'Van Erciş Merkez',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
