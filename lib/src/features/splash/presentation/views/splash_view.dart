import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';
import 'package:weather_science/main.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/di/di.dart';
import '../../../../core/mixins/after_layout_mixin.dart';
import '../../../../core/router/router.gr.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../auth/data/models/remote/user/user_model.dart';
import '../../../root/presentation/views/calendar/presentation/bloc/calendar_bloc.dart';
import '../../../root/presentation/views/home/presentation/bloc/current_day_bloc.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with AfterLayoutMixin {
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 2));
    await checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: CupertinoPageScaffold(
        child: Center(
          child: Image.asset(AppIcons.splashLogo)
        ),
      ),
    );
  }

  Future<void> checkAuth() async {
    HiveService.getCity();
    if(await HiveService.isVerifiedUser()){
      Map<String, dynamic> data = await HiveService.getUserInfo();
      AppUtils.user = UserModel.fromJson(data);
        di<CalendarBloc>().add(FetchCalendarDataEvent(context: context, q: AppUtils.cityName, units: AppUtils.units));
        di<CurrentDayBloc>().add(FetchDataEvent(q: AppUtils.cityName, units: AppUtils.units, context: context));

    }else{
      await context.router.push(SelectLangView());
    }

  }
}
