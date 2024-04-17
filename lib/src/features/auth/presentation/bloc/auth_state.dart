part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginState extends AuthState {
  LoginState({required this.user});
  final UserModel user;
  @override
  List<Object> get props => [user];
}

class NoRegisterState extends AuthState {
  final bool isNoRegister;
  NoRegisterState({required this.isNoRegister});
  @override
  List<Object> get props => [isNoRegister];
}
class LogoOutState extends AuthState {}

class ExceptionState extends AuthState {
  final String message;
  ExceptionState({required this.message});
  @override
  List<Object> get props => [message];
}

