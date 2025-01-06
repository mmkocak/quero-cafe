import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/coffee_size/coffee_size_cubit.dart';
import 'package:quero_cafe/generated/l10n.dart';
import 'package:quero_cafe/view/widgets/coffee_detail_bottom_bar.dart';
import 'package:quero_cafe/view/mixins/coffee_size_button_mixin.dart';

class CoffeeDetailScreen extends StatelessWidget with CoffeeSizeButtonMixin {
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
            body: Stack(
              children: [
                Padding(
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
                              buildSizeButton(context, 'P', state.selectedSize == 'P'),
                              SizedBox(width: screenWidth * 0.02),
                              buildSizeButton(context, 'M', state.selectedSize == 'M'),
                              SizedBox(width: screenWidth * 0.02),
                              buildSizeButton(context, 'G', state.selectedSize == 'G'),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CoffeeDetailBottomBar(price: price),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
