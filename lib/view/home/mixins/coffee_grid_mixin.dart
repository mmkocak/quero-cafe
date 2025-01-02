import 'package:flutter/material.dart';
import 'package:quero_cafe/view/widgets/coffee_item_card.dart';

mixin CoffeeGridMixin {
  Widget buildCoffeeGrid(BuildContext context, double screenWidth, double screenHeight, List<Map<String, dynamic>> coffees) {
    return Container(
      height: screenHeight * 0.7,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: RawScrollbar(
        thumbColor: Color(0xFFB17445),
        radius: Radius.circular(20),
        thickness: 5,
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            top: screenHeight * 0.1,
            right: screenWidth * 0.02,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: coffees.length,
          itemBuilder: (context, index) {
            return CoffeeItemCard(
              name: coffees[index]['name'],
              description: coffees[index]['description'],
              price: coffees[index]['price'],
              imageUrl: coffees[index]['image'],
            );
          },
        ),
      ),
    );
  }
} 