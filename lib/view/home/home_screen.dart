import 'package:flutter/material.dart';
import 'package:quero_cafe/view/widgets/coffee_item_card.dart';
import 'package:quero_cafe/view/widgets/coffee_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    final List<Map<String, dynamic>> coffees = [
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

    return Scaffold(
      body: Stack(
        children: [
          Column(
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
              Expanded(
                child: Container(
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
                ),
              ),
            ],
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
