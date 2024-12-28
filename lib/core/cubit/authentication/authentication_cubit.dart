import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthState> {
  AuthenticationCubit() : super(AuthInitial());

  Future<void> registerUser(String username,  String email ,String password) async {
    if (username.isEmpty || password.isEmpty || email.isEmpty) {
      emit(AuthFailure('All fields are required.'));
      return;
    }

    emit(AuthLoading());

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:5000/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
          'email': email
        }),
      );

      if (response.statusCode == 200) {
        emit(AuthSuccess());
      } else {
        final error = jsonDecode(response.body)['error'];
        emit(AuthFailure(error ?? 'Unknown error occurred.'));
         debugPrint('Sunucu hatası: ${response.statusCode}');
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  Future<void> loginUser(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      emit(AuthFailure('Username and password are required.'));
      return;
    }

    emit(AuthLoading());

    try {
      final response = await http.post(
        Uri.parse("http://10.0.2.2:5000/login"), // Your login endpoint
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final loginResponse = json.decode(response.body);
        String? token = loginResponse['token']; // Assuming your server returns a token

        if (token != null) {
          emit(AuthSuccess(token: token)); // Emit the token with the success state
        } else {
          emit(AuthFailure('Login successful, but no token received.'));
        }


      } else {
        final Map<String, dynamic> errorBody = jsonDecode(response.body);
        String errorMessage = errorBody['error'] ?? 'Unknown error occurred.';
        emit(AuthFailure(errorMessage));
        debugPrint('Server error: ${response.statusCode}, Message: $errorMessage'); // Include the error message in debug print
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
