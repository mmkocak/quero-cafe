import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthState> {
  AuthenticationCubit() : super(AuthInitial());

  static const String baseUrl = "http://10.0.2.2:5000";
  final _auth = FirebaseAuth.instance;

  /// Kullanıcının giriş yapmış olup olmadığını kontrol et
  Future<void> checkLoginStatus() async {
    emit(AuthLoading());
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final token = await currentUser.getIdToken();
        emit(AuthSuccess(token: token));
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  /// Kullanıcı kayıt işlemi
  Future<void> registerUser(String username, String email, String password) async {
    if (username.isEmpty || password.isEmpty || email.isEmpty) {
      emit(AuthFailure('Tüm alanlar zorunludur.'));
      return;
    }

    emit(AuthLoading());

    try {
      // Önce Firebase'de kullanıcı oluştur
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Firebase'de kullanıcı oluşturulduktan sonra backend'e kaydet
        final response = await http.post(
          Uri.parse("$baseUrl/register"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'username': username,
            'password': password,
            'email': email,
          }),
        );

        if (response.statusCode == 200) {
          final token = await userCredential.user!.getIdToken();
          emit(AuthSuccess(token: token));
        } else {
          // Backend kaydı başarısız olursa Firebase'den de sil
          await userCredential.user?.delete();
          final error = jsonDecode(response.body)['error'] ?? 'Bilinmeyen hata oluştu.';
          emit(AuthFailure(error));
        }
      }
    } catch (e) {
      emit(AuthFailure("Kayıt hatası: ${e.toString()}"));
    }
  }

  /// Kullanıcı giriş işlemi
  Future<void> loginUser(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      emit(AuthFailure('Kullanıcı adı ve şifre zorunludur.'));
      return;
    }

    emit(AuthLoading());

    try {
      // Önce backend'de doğrula
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String token = data['token'];
        // Backend doğrulaması başarılıysa Firebase'de oturum aç
        await _auth.signInWithCustomToken(token);
        emit(AuthSuccess(token: token));
      } else {
        final error = jsonDecode(response.body)['error'] ?? 'Bilinmeyen hata oluştu.';
        emit(AuthFailure(error));
      }
    } catch (e) {
      emit(AuthFailure("Giriş hatası: ${e.toString()}"));
    }
  }

  /// Kullanıcı çıkış işlemi
  Future<void> logoutUser() async {
    try {
      // Backend'e çıkış bildir
      await http.post(
        Uri.parse("$baseUrl/logout"),
        headers: {'Content-Type': 'application/json'},
      );
      
      // Firebase'den çıkış yap
      await _auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure("Çıkış işlemi başarısız: ${e.toString()}"));
    }
  }
}
