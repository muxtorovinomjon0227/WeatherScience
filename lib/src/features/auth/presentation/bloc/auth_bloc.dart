import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/router/router.gr.dart';
import '../../../../core/utils/pop_up_modal.dart';
import '../../data/models/remote/user/user.dart';
import '../../data/repositories/auth_repository_impl.dart';
part 'auth_event.dart';

part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LogoOutState()) {
    on<LoginEvent>((event, emit) async {
      await _login(event, emit);
    });
    on<LogOutEvent>((event, emit) async {
      await _logOut(event, emit);
    });
  }

  final _authRepositoryImpl = AuthRepositoryImpl();

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = await _authRepositoryImpl.login(event.login, event.password);
      if (user != null) {
        emit(LoginState(user: user));
        await event.context.router.push(const HomeView());
      } else {
        await popUp(event.context, error: 'oops'.tr());
      }
    } catch (e) {
      await popUp(event.context, error: e.toString());
    }
  }

  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    final tokenBox = Hive.box('token');
    await tokenBox.deleteFromDisk();
    emit(
      LogoOutState(),
    );
  }
}
