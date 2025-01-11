import 'package:flutter/material.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: const [
          Icon(Icons.local_offer, color: Color(0xFFB17445)),
          SizedBox(width: 8),
          Text(
            '1 Cupom aplicado',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }
} 