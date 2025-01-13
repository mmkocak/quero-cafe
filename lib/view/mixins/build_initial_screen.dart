import 'package:flutter/material.dart';
import 'package:quero_cafe/core/routes/app_router.dart';
import 'package:quero_cafe/core/cubit/authentication/authentication_cubit.dart';

class BuildInitialScreen {
  String getInitialRoute(AuthState authState) {
    if (authState is AuthLoading) {
      return AppRouter.splash; // Splash ekranı (yükleniyor)
    } else if (authState is AuthSuccess) {
      return AppRouter.home; // Kullanıcı giriş yapmışsa ana sayfa
    } else if (authState is AuthLoggedOut || authState is AuthInitial) {
      return AppRouter.login; // Kullanıcı giriş yapmamışsa login
    } else {
      return AppRouter.splash; // Varsayılan olarak Splash ekranı
    }
  }
}
