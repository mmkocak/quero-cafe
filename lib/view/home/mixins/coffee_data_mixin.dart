import 'package:flutter/material.dart';

mixin CoffeeDataMixin {
  List<Map<String, dynamic>> get coffeeList => [
    {
      'name': 'Cappucino',
      'description': 'com Chocolate',
      'price': 11.50,
      'image': 'assets/images/cuppucino.png',
    },
    {
      'name': 'Coffee Latte',
      'description': 'com Leite',
      'price': 8.50,
      'image': 'assets/images/latte.png',
    },
    {
      'name': 'Cold Brew',
      'description': 'com Gelo',
      'price': 9.50,
      'image': 'assets/images/cold_brew.png',
    },
    {
      'name': 'Alpino',
      'description': 'com Chocolate',
      'price': 12.50,
      'image': 'assets/images/alpino.png',
    },
  ];
} 