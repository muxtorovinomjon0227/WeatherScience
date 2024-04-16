import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../main.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/theme/presentation/cubit/theme_cubit.dart';
import '../../features/theme/presentation/cubit/theme_state.dart';
import '../di/di.dart';
import '../router/router.dart';
import '../services/on_connectivity_changed_service.dart';
import '../utils/app_utils.dart';


class App extends StatelessWidget with WidgetsBindingObserver {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      InternetService.resume();
    } else if (state == AppLifecycleState.inactive) {
    } else if (state == AppLifecycleState.detached) {
    } else if (state == AppLifecycleState.paused) {
      InternetService.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    logger.i(dotenv.env['API_KEY']);
    WidgetsBinding.instance.addObserver(this);
    InternetService.onConnectivityChanged(context);
    int getDeviceType() {
      final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
      AppUtils.isTable = data.size.shortestSide < 600 ? false : true;
      return data.size.shortestSide < 600 ? 1 : 2;
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
      child: ScreenUtilInit(
        designSize: getDeviceType() == 1 ? const Size(375, 812) : const Size(600, 1024),
        builder: (_, __) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>.value(value: di.get<AuthBloc>()),
            ],
            child: BlocProvider<ThemeCubit>(
              create: (context) => ThemeCubit(),
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: state.themeData,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    locale: context.locale,
                    routerConfig: _appRouter.config(),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
