import 'package:flutter/material.dart';

class DeliveryToggle extends StatelessWidget {
  final bool isDelivery;
  final Function(bool) onDeliveryChanged;

  const DeliveryToggle({
    super.key,
    required this.isDelivery,
    required this.onDeliveryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(51),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            _buildToggleButton(
              text: 'Entrega',
              isSelected: isDelivery,
              onTap: () => onDeliveryChanged(true),
            ),
            _buildToggleButton(
              text: 'Retirada',
              isSelected: !isDelivery,
              onTap: () => onDeliveryChanged(false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? const Color(0xFFB17445) : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
} 