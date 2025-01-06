import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Detalhes',
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
              'com Chocolate',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: screenWidth * 0.035,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            
            // Açıklama
            Text(
              'Descrição',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Um cappuccino é uma bebida de aproximadamente, sendo 10% de café expresso e 32% de leite de fresco e 56% de café, utilizamos grãos especiais...',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: screenWidth * 0.035,
              ),
            ),
            Text(
              'Ler mais',
              style: TextStyle(
                color: Color(0xFFB17445),
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            
            // Boyut Seçimi
            Text(
              'Tamanhos disponíveis',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                _buildSizeButton('P', true),
                SizedBox(width: screenWidth * 0.02),
                _buildSizeButton('M', false),
                SizedBox(width: screenWidth * 0.02),
                _buildSizeButton('G', false),
              ],
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
                        'Valor',
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
                      'Adicionar no carrinho',
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
  }

  Widget _buildSizeButton(String size, bool isSelected) {
    return Container(
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
        size,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xFFB17445),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
} 