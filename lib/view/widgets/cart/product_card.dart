import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/core/models/cart_item.dart';

class ProductCard extends StatelessWidget {
  final CartItem item;

  const ProductCard({
    super.key,
    required this.item,
  });

  String _getSizeText(String? size) {
    if (size == null) return 'Pequeno';
    
    switch (size) {
      case 'P': return 'Pequeno';
      case 'M': return 'Médio';
      case 'G': return 'Grande';
      default: return 'Pequeno';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item.imageUrl,
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                item.description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'R\$ ${item.price.toStringAsFixed(2)} • ${_getSizeText(item.size)}',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () => context.read<CartCubit>().decrementQuantity(item.id),
              icon: const Icon(Icons.remove),
              color: const Color(0xFFB17445),
              padding: EdgeInsets.zero,
            ),
            Text(
              item.quantity.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: () => context.read<CartCubit>().incrementQuantity(item.id),
              icon: const Icon(Icons.add),
              color: const Color(0xFFB17445),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    );
  }
} 