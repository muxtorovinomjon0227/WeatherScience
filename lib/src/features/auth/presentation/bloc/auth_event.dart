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

class LogOutEvent extends AuthEvent {}
