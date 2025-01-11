import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/navigation/navigation_cubit.dart';
import 'package:quero_cafe/view/widgets/cart/delivery_toggle.dart';

class CartHeader extends StatelessWidget {
  final bool isDelivery;
  final Function(bool) onDeliveryChanged;

  const CartHeader({
    super.key,
    required this.isDelivery,
    required this.onDeliveryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top + 280,
      color: const Color(0xFFB17445),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () => context.read<NavigationCubit>().changeIndex(0),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 16),
          DeliveryToggle(
            isDelivery: isDelivery,
            onDeliveryChanged: onDeliveryChanged,
          ),
        ],
      ),
    );
  }
} 