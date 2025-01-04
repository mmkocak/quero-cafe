import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quero_cafe/core/cubit/navigation/navigation_cubit.dart';
import 'package:quero_cafe/view/screens/cart_screen.dart';
import 'package:quero_cafe/view/screens/map_screen.dart';
import 'package:quero_cafe/view/home/home_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          switch (currentIndex) {
            case 0:
              return  HomeScreen();
            case 1:
              return const CartScreen();
            case 2:
              return const MapScreen();
            default:
              return  HomeScreen();
          }
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: context.watch<NavigationCubit>().state,
            onTap: (index) {
              context.read<NavigationCubit>().changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xFFB17445),
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 30),
                label: "Ana Sayfa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, size: 30),
                label: "Sepet",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map, size: 30),
                label: "Harita",
              ),
            ],
          ),
        ),
      ),
    );
  }
}