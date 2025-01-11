import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/map/map_cubit.dart';
import 'package:quero_cafe/view/screens/map_screen.dart';
import 'package:latlong2/latlong.dart';
import 'package:quero_cafe/generated/l10n.dart';

class AddressCard extends StatelessWidget {
  final bool isDelivery;

  const AddressCard({
    super.key,
    required this.isDelivery,
  });

  void _navigateToMap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MapScreen(),
      ),
    );
  }

  String _formatLocation(LatLng? location) {
    if (location == null) return S.current.cartSelectAddress;
    return '${location.latitude.toStringAsFixed(6)}, ${location.longitude.toStringAsFixed(6)}';
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -60),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isDelivery 
                ? S.of(context).cartDeliveryAddress 
                : S.of(context).cartPickupAddress,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                return Text(
                  _formatLocation(state.userLocation),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () => _navigateToMap(context),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_location_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          S.of(context).cartEditAddress,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.note_add_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          S.of(context).cartAddNote,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}