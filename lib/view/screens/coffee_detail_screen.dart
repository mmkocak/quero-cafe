import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/coffee_size/coffee_size_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';

class CoffeeDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const CoffeeDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => CoffeeSizeCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                S.of(context).details,
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kahve Resmi
                  Container(
                    height: screenHeight * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
                  // Kahve Adı ve İkonlar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFB17445),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.coffee,
                              color: Color(0xFFB17445),
                              size: 20,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFB17445),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.water_drop,
                              color: Color(0xFFB17445),
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    S.of(context).with_chocolate,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
                  // Açıklama
                  Text(
                    S.of(context).description,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    S.of(context).coffee_description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  Text(
                    S.of(context).read_more,
                    style: TextStyle(
                      color: Color(0xFFB17445),
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  
                  // Boyut Seçimi
                  Text(
                    S.of(context).available_sizes,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  BlocBuilder<CoffeeSizeCubit, CoffeeSizeState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          _buildSizeButton(context, 'P', state.selectedSize == 'P'),
                          SizedBox(width: screenWidth * 0.02),
                          _buildSizeButton(context, 'M', state.selectedSize == 'M'),
                          SizedBox(width: screenWidth * 0.02),
                          _buildSizeButton(context, 'G', state.selectedSize == 'G'),
                        ],
                      );
                    },
                  ),
                  
                  const Spacer(),
                  
                  // Fiyat ve Sepete Ekle Butonu
                  Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).price,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                            Text(
                              'R\$ ${price.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFB17445),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFB17445),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSizeButton(BuildContext context, String size, bool isSelected) {
    String sizeText = size == 'P' ? S.of(context).small :
                      size == 'M' ? S.of(context).medium :
                      S.of(context).large;
                      
    return GestureDetector(
      onTap: () => context.read<CoffeeSizeCubit>().selectSize(size),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFB17445) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xFFB17445),
            width: 1,
          ),
        ),
        child: Text(
          sizeText,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFFB17445),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
} 