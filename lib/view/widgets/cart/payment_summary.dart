import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/view/mixins/cart_payment_mixin.dart';

class PaymentSummary extends StatelessWidget with CartPaymentMixin {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo de Pagamento',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            buildPaymentRow(
              'Preço',
              '\$ ${state.totalPrice.toStringAsFixed(2)}'
            ),
            const SizedBox(height: 8),
            buildPaymentRow(
              'Valor da entrega',
              '\$ ${state.deliveryFee.toStringAsFixed(2)}',
              originalPrice: '\$ ${context.read<CartCubit>().originalDeliveryFee.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            buildPaymentRow(
              'Total',
              '\$ ${state.finalTotal.toStringAsFixed(2)}',
              isBold: true
            ),
          ],
        );
      },
    );
  }
}
