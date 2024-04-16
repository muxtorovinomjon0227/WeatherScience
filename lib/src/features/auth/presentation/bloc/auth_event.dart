part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  const LoginEvent({
    required this.login,
    required this.password,
    required this.context,
  });
  final String login;
  final String password;
  final BuildContext context;
}

class LogOutEvent extends AuthEvent {}
