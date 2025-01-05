import 'package:flutter/material.dart';
import 'package:quero_cafe/view/login/login_screen.dart';
import 'package:quero_cafe/view/register/register_screen.dart';
import 'package:quero_cafe/view/splash/splash_screen.dart';
import 'package:quero_cafe/view/widgets/custom_bottom_nav_bar.dart';
import 'package:quero_cafe/view/screens/coffee_detail_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String coffeeDetail = '/coffee-detail';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    home: (context) => const CustomBottomNavBar(),
  };
} 