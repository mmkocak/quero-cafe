import 'package:flutter/material.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/core/cubit/coffee_size/coffee_size_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/cart/cart_cubit.dart';
import 'package:quero_cafe/core/models/cart_item.dart';

class CoffeeDetailBottomBar extends StatelessWidget {
  final double price;
  final String name;
  final String description;
  final String imageUrl;
  final String size;

  const CoffeeDetailBottomBar({
    super.key,
    required this.price,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(26),
            blurRadius: 15,
            offset: const Offset(0, -2),
            spreadRadius: 1,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).price,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  BlocBuilder<CoffeeSizeCubit, CoffeeSizeState>(
                    builder: (context, state) {
                      final adjustedPrice = price * state.priceMultiplier;
                      return Text(
                        adjustedPrice.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFB17445),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().addToCart(CartItem(
                    id: '${name}_$size',
                    name: name,
                    description: description,
                    price: price,
                    imageUrl: imageUrl,
                    size: size,
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ürün sepete eklendi')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB17445),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.015,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  S.of(context).add_to_cart,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 