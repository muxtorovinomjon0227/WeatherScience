// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i3;
import '../../features/language/presentation/bloc/language_bloc.dart' as _i6;
import '../../features/root/presentation/views/calendar/presentation/bloc/calendar_bloc.dart'
    as _i4;
import '../../features/root/presentation/views/home/presentation/bloc/current_day_bloc.dart'
    as _i5;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.AuthBloc>(() => _i3.AuthBloc());
  gh.lazySingleton<_i4.CalendarBloc>(() => _i4.CalendarBloc());
  gh.lazySingleton<_i5.CurrentDayBloc>(() => _i5.CurrentDayBloc());
  gh.lazySingleton<_i6.LanguageBloc>(() => _i6.LanguageBloc());
  return getIt;
}
