import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/view/widgets/cart/cart_header.dart';
import 'package:quero_cafe/view/widgets/cart/address_card.dart';
import 'package:quero_cafe/view/widgets/cart/product_card.dart';
import 'package:quero_cafe/view/widgets/cart/payment_summary.dart';
import 'package:quero_cafe/view/widgets/cart/coupon_section.dart';
import 'package:quero_cafe/view/widgets/cart/cart_bottom_bar.dart';
import 'package:quero_cafe/core/models/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isDelivery = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CartHeader(
                      isDelivery: isDelivery,
                      onDeliveryChanged: (value) => setState(() => isDelivery = value),
                    ),
                    AddressCard(isDelivery: isDelivery),
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
                                itemCount: state.items.length,
                                separatorBuilder: (context, index) => const Divider(),
                                itemBuilder: (context, index) {
                                  return ProductCard(item: state.items[index]);
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
            ),
          ),
          const CartBottomBar(),
        ],
      ),
    );
  }
} 