import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/core/cubit/delivery/delivery_cubit.dart';
import 'package:quero_cafe/view/widgets/cart/cart_header.dart';
import 'package:quero_cafe/view/widgets/cart/address_card.dart';
import 'package:quero_cafe/view/widgets/cart/product_card.dart';
import 'package:quero_cafe/view/widgets/cart/payment_summary.dart';
import 'package:quero_cafe/view/widgets/cart/coupon_section.dart';
import 'package:quero_cafe/view/widgets/cart/cart_bottom_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                return BlocBuilder<DeliveryCubit, DeliveryState>(
                  builder: (context, deliveryState) {
                    return Column(
                      children: [
                        CartHeader(
                          isDelivery: deliveryState.isDelivery,
                          onDeliveryChanged: (value) => 
                            context.read<DeliveryCubit>().toggleDelivery(value),
                        ),
                        AddressCard(isDelivery: deliveryState.isDelivery),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                    itemCount: cartState.items.length,
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemBuilder: (context, index) {
                                      return ProductCard(
                                        item: cartState.items[index]
                                      );
                                    },
                                  ),
                                ),
                                const CouponSection(),
                                const SizedBox(height: 16),
                                const PaymentSummary(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          const CartBottomBar(),
        ],
      ),
    );
  }
}
