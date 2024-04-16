import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_science/src/core/router/router.gr.dart';
import '../../../../core/utils/dialogs.dart';
import '../../data/repositories/auth_repository_impl.dart';
part 'auth_event.dart';

part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LogoOutState()) {
    on<LoginWithGoogleEvent>((event, emit) async {
      await _loginWithGoogle(event, emit);
    });
    on<LogOutEvent>((event, emit) async {
      await _logOut(event, emit);
    });
  }

  final _authRepositoryImpl = AuthRepositoryImpl();

  Future<void> _loginWithGoogle(LoginWithGoogleEvent event, Emitter<AuthState> emit) async {
   await _authRepositoryImpl.signInWithGoogle(context: event.context).then((value) =>
        value.fold((l) => ExceptionState(message: l.message),
                (r){
                  DialogUtils.popDialog();
          event.context.router.push(const HomeView());
                  LoginState(user: r);}));
  }

  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {}
}
