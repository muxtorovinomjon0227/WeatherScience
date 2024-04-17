import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_science/src/core/services/hive_service.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/mixins/after_layout_mixin.dart';
import '../../../../core/router/router.gr.dart';

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
    await Future.delayed(const Duration(seconds: 1));
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
    await context.router.push(const AuthView());
  }
}
