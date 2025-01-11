import 'package:flutter/material.dart';
import 'package:quero_cafe/view/mixins/cart_payment_mixin.dart';

class PaymentSummary extends StatelessWidget with CartPaymentMixin {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
        buildPaymentRow('Preço', 'R\$ 14,50'),
        const SizedBox(height: 8),
        buildPaymentRow(
          'Valor da entrega',
          'R\$ 10,00',
          originalPrice: 'R\$ 30,00',
        ),
        const SizedBox(height: 8),
        buildPaymentRow('Total', 'R\$ 4,50', isBold: true),
      ],
    );
  }
} 