part of 'authentication_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String? token;
  final String username;
  const AuthSuccess({
    this.token, 
    required this.username,
  });

  @override
  List<Object?> get props => [token, username];
}

class AuthLoggedOut extends AuthState {}

class AuthFailure extends AuthState {
  final String error;
  const AuthFailure(this.error);

  @override
  List<Object> get props => [error];
}
