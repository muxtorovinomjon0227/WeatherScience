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

class LogOutEvent extends AuthEvent {}
