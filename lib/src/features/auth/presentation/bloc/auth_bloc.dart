import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_science/src/core/di/di.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import 'package:weather_science/src/core/utils/pop_up_modal.dart';
import 'package:weather_science/src/features/auth/data/models/remote/user/user_model.dart';
import 'package:weather_science/src/features/root/presentation/views/home/presentation/bloc/current_day_bloc.dart';
import '../../../root/presentation/views/calendar/presentation/bloc/calendar_bloc.dart';
import '../../data/repositories/auth_repository_impl.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LogoOutState()) {
    on<LoginWithGoogleEvent>((event, emit) async {
      await _loginWithGoogle(event, emit);
    });
    on<LoginEmailPassEvent>((event, emit) async {
      await _logInEmailPass(event, emit);
    });
    on<SignUpEmailPassEvent>((event, emit) async {
      await _signUpEmailPass(event, emit);
    });

    on<SignUpOrSignInEvent>((event, emit)  {
       _sigInOrSignUp(event, emit);
    });
  }

  final _authRepositoryImpl = AuthRepositoryImpl();

  Future<void> _loginWithGoogle(LoginWithGoogleEvent event, Emitter<AuthState> emit) async {
   await _authRepositoryImpl.signInWithGoogle(context: event.context).then((value) =>
        value.fold((l) {
          popUp(event.context, error: l.message);
          ExceptionState(message: l.message);}, (r){
          di<CalendarBloc>().add(FetchCalendarDataEvent(context: event.context, q: AppUtils.cityName, units: AppUtils.units));
          di<CurrentDayBloc>().add(FetchDataEvent(q: AppUtils.cityName, units: AppUtils.units, context: event.context));}));}

  Future<void> _logInEmailPass(LoginEmailPassEvent event, Emitter<AuthState> emit) async {
   await _authRepositoryImpl.signInEmailPassword(context: event.context, email: event.email, password: event.pass).then(
           (value) => value.fold((l){
             emit(NoRegisterState(isNoRegister: true));
             popUp(event.context, error: l.message);}, (r){
             di<CalendarBloc>().add(FetchCalendarDataEvent(context: event.context, q: AppUtils.cityName, units: AppUtils.units));
             di<CurrentDayBloc>().add(FetchDataEvent(q: AppUtils.cityName, units: AppUtils.units, context: event.context));}));
  }

  Future<void> _signUpEmailPass(SignUpEmailPassEvent event, Emitter<AuthState> emit) async {
   await _authRepositoryImpl.signUpEmailPassword(context: event.context, email: event.email, password: event.pass).then(
            (value) => value.fold((l){emit(NoRegisterState(isNoRegister: true));
          popUp(event.context, error: l.message);}, (r){
              di<CalendarBloc>().add(FetchCalendarDataEvent(context: event.context, q: AppUtils.cityName, units: AppUtils.units));
              di<CurrentDayBloc>().add(FetchDataEvent(q: AppUtils.cityName, units: AppUtils.units, context: event.context));}));
  }

  void _sigInOrSignUp(SignUpOrSignInEvent event, Emitter<AuthState> emit){
    emit(NoRegisterState(isNoRegister: event.isNoRegister));
  }
}
