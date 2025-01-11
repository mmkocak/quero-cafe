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
        final cartCubit = context.read<CartCubit>();
        
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
            buildPaymentRow('Preço', 'R\$ ${cartCubit.totalPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            buildPaymentRow(
              'Valor da entrega',
              'R\$ ${cartCubit.deliveryFee.toStringAsFixed(2)}',
              originalPrice: 'R\$ ${cartCubit.originalDeliveryFee.toStringAsFixed(2)}',
            ),
            const SizedBox(height: 8),
            buildPaymentRow(
              'Total',
              'R\$ ${cartCubit.finalTotal.toStringAsFixed(2)}',
              isBold: true
            ),
          ],
        );
      },
    );
  }
} 