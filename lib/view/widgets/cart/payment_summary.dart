import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  Widget buildPaymentRow(String title, String value,
      {String? originalPrice, bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (originalPrice != null) ...[
          Text(
            originalPrice,
            style: const TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 8),
        ],
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).cartPaymentSummary,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            buildPaymentRow(S.of(context).cartPrice,
                '\$ ${state.totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            buildPaymentRow(
              S.of(context).cartDeliveryFee,
              '\$ ${state.deliveryFee.toStringAsFixed(2)}',
              originalPrice:
                  '\$ ${context.read<CartCubit>().originalDeliveryFee.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            buildPaymentRow(S.of(context).cartTotal,
                '\$ ${state.finalTotal.toStringAsFixed(2)}',
                isBold: true),
          ],
        );
      },
    );
  }
}
