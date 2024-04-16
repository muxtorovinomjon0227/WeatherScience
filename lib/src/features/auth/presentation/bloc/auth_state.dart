part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginState extends AuthState {
  LoginState({
    required this.user,
  });
  final User user;
  @override
  List<Object> get props => [user];
}

class LogoOutState extends AuthState {}

