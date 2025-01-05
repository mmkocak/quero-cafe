import 'package:flutter/material.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';
import 'package:quero_cafe/view/login/login_screen.dart';
import 'package:quero_cafe/view/splash/splash_screen.dart';
import 'package:quero_cafe/view/widgets/custom_bottom_nav_bar.dart';

mixin BuildInitialScreen {
   Widget buildInitialScreen(AuthState authState) {
    if (authState is AuthLoading) {
      return const SplashScreen();
    } else if (authState is AuthSuccess) {
      return const CustomBottomNavBar();
    } else {
      return const LoginScreen();
    }
  } }