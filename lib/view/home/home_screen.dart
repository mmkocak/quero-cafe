import 'package:flutter/material.dart';
import 'package:quero_cafe/view/home/mixins/coffee_data_mixin.dart';
import 'package:quero_cafe/view/home/mixins/coffee_grid_mixin.dart';
import 'package:quero_cafe/view/home/mixins/header_mixin.dart';
import 'package:quero_cafe/view/widgets/coffee_card.dart';

class HomeScreen extends StatelessWidget with CoffeeDataMixin, HeaderMixin, CoffeeGridMixin {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(context, screenWidth, screenHeight),
                buildCoffeeGrid(context, screenWidth, screenHeight, coffeeList),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.22,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: CoffeeCard(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
          ),
        ],
      ),
    );
  }
} 