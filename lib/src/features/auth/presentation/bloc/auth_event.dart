part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class LoginWithGoogleEvent extends AuthEvent {
  const LoginWithGoogleEvent({required this.context,});
  final BuildContext context;
}
class LoginEmailPassEvent extends AuthEvent {
  final BuildContext context;
  final String email;
  final String pass;
  const LoginEmailPassEvent({required this.email, required this.pass, required this.context,});
}

class SignUpEmailPassEvent extends AuthEvent {
  final BuildContext context;
  final String email;
  final String pass;
  const SignUpEmailPassEvent({required this.email, required this.pass, required this.context});
}

class SignUpOrSignInEvent extends AuthEvent {
  final bool isNoRegister;
  const SignUpOrSignInEvent({required this.isNoRegister});
  @override
  List<Object> get props => [isNoRegister];
}

class LogOutEvent extends AuthEvent {}
