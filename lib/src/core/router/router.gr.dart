// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:weather_science/src/features/auth/presentation/views/auth_view.dart'
    as _i1;
import 'package:weather_science/src/features/language/presentation/views/select_lang_view.dart'
    as _i6;
import 'package:weather_science/src/features/root/presentation/views/calendar/presentation/views/calendar_view.dart'
    as _i2;
import 'package:weather_science/src/features/root/presentation/views/home/presentation/views/home_view.dart'
    as _i4;
import 'package:weather_science/src/features/root/presentation/views/root_view.dart'
    as _i5;
import 'package:weather_science/src/features/splash/presentation/views/splash_view.dart'
    as _i7;
import 'package:weather_science/src/features/theme/presentation/views/choose_theme_view.dart'
    as _i3;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AuthView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthView(),
      );
    },
    CalendarView.name: (routeData) {
      final args = routeData.argsAs<CalendarViewArgs>(
          orElse: () => const CalendarViewArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CalendarView(key: args.key),
      );
    },
    ChooseThemeView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChooseThemeView(),
      );
    },
    HomeView.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeView(key: args.key),
      );
    },
    RootView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RootView(),
      );
    },
    SelectLangView.name: (routeData) {
      final args = routeData.argsAs<SelectLangViewArgs>(
          orElse: () => const SelectLangViewArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SelectLangView(key: args.key),
      );
    },
    SplashView.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthView]
class AuthView extends _i8.PageRouteInfo<void> {
  const AuthView({List<_i8.PageRouteInfo>? children})
      : super(
          AuthView.name,
          initialChildren: children,
        );

  static const String name = 'AuthView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CalendarView]
class CalendarView extends _i8.PageRouteInfo<CalendarViewArgs> {
  CalendarView({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CalendarView.name,
          args: CalendarViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CalendarView';

  static const _i8.PageInfo<CalendarViewArgs> page =
      _i8.PageInfo<CalendarViewArgs>(name);
}

class CalendarViewArgs {
  const CalendarViewArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'CalendarViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ChooseThemeView]
class ChooseThemeView extends _i8.PageRouteInfo<void> {
  const ChooseThemeView({List<_i8.PageRouteInfo>? children})
      : super(
          ChooseThemeView.name,
          initialChildren: children,
        );

  static const String name = 'ChooseThemeView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeView]
class HomeView extends _i8.PageRouteInfo<HomeViewArgs> {
  HomeView({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeView.name,
          args: HomeViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i8.PageInfo<HomeViewArgs> page =
      _i8.PageInfo<HomeViewArgs>(name);
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.RootView]
class RootView extends _i8.PageRouteInfo<void> {
  const RootView({List<_i8.PageRouteInfo>? children})
      : super(
          RootView.name,
          initialChildren: children,
        );

  static const String name = 'RootView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SelectLangView]
class SelectLangView extends _i8.PageRouteInfo<SelectLangViewArgs> {
  SelectLangView({
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          SelectLangView.name,
          args: SelectLangViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SelectLangView';

  static const _i8.PageInfo<SelectLangViewArgs> page =
      _i8.PageInfo<SelectLangViewArgs>(name);
}

class SelectLangViewArgs {
  const SelectLangViewArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SelectLangViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SplashView]
class SplashView extends _i8.PageRouteInfo<void> {
  const SplashView({List<_i8.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
