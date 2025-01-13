import 'package:flutter/material.dart';
import 'package:quero_cafe/view/login/login_screen.dart';
import 'package:quero_cafe/view/register/register_screen.dart';
import 'package:quero_cafe/view/screens/coffee_detail_screen.dart';
import 'package:quero_cafe/view/splash/splash_screen.dart';
import 'package:quero_cafe/view/widgets/custom_bottom_nav_bar.dart';
import 'package:quero_cafe/view/screens/map_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String coffeeDetail = '/coffee-detail';
  static const String map = '/map';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
        case map:
        return MaterialPageRoute(builder: (_) => const MapScreen());
       
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
