//ignore_for_file: public_member_api_docs
import 'package:auto_route/auto_route.dart';
import  './router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashView.page, initial: true),
        AutoRoute(page: AuthView.page),
        AutoRoute(page: SelectLangView.page),
        CustomRoute(
          page: RootView.page,
          children: [
            AutoRoute(page: HomeView.page),
            AutoRoute(page: CalendarView.page),
          ],
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
