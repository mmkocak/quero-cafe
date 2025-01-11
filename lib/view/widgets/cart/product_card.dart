import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final int quantity;
  final Function() onIncrease;
  final Function() onDecrease;

  const ProductCard({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/cuppucino.png',
            width: 48,
            height: 48,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cappucino',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'com Chocolate',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onDecrease,
              icon: const Icon(Icons.remove),
              color: const Color(0xFFB17445),
              padding: EdgeInsets.zero,
            ),
            Text(
              quantity.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            IconButton(
              onPressed: onIncrease,
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