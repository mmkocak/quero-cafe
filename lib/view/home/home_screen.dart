import 'package:flutter/material.dart';
import 'package:quero_cafe/view/widgets/coffee_card.dart';

class HomeScreen extends StatelessWidget {
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
                Container(
                  height: screenHeight * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF8B4513),
                        Color(0xFFB17445),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.01,
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Bem-vindo',
                                    style: TextStyle(
                                      color: Color(0xFFB7B7B7),
                                      fontSize: screenWidth * 0.035,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    'Fulano de Tal',
                                    style: TextStyle(
                                      color: Color(0xFFDDDDDD),
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: screenWidth * 0.06,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: Color(0xFFB17445),
                                  size: screenWidth * 0.08,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.7,
                  child: Center(
                    child: Text(
                      'Ana Sayfa İçeriği',
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
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