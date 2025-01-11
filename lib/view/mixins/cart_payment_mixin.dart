import 'package:flutter/material.dart';

mixin CartPaymentMixin {
  Widget buildPaymentRow(String label, String value, {String? originalPrice, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        Row(
          children: [
            if (originalPrice != null)
              Text(
                originalPrice,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            if (originalPrice != null) const SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPaymentMethod(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFB17445),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 