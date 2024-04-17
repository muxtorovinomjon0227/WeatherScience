import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/main.dart';
import 'package:weather_science/src/core/di/di.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/utils/dialogs.dart';
import 'package:weather_science/src/features/root/presentation/views/calendar/presentation/bloc/calendar_bloc.dart';
import 'package:weather_science/src/features/root/presentation/views/root_appbar.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/router/router.gr.dart';
import '../../../../core/utils/app_utils.dart';
import '../../../draver/presentation/views/drawer_view.dart';
import 'home/presentation/bloc/current_day_bloc.dart';

@RoutePage()
class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}
class _RootViewState extends State<RootView> {
  late BuildContext _ctx;
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return AutoTabsRouter(
      routes:  [
        HomeView(),
        CalendarView(),
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return PopScope(
          canPop: false,
          onPopInvoked: (value) async {
            await context.router.push(HomeView());
          },
          child: Scaffold(
            drawer: Drawer(
                width: 300.sp,
                backgroundColor: AppColors.navBarColor,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                child: const DrawerView()),
          
            appBar: rootAppBar(context),
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: NavigationBar(
              indicatorColor: Colors.transparent,
               backgroundColor: AppColors.navBarColor,
              height: 64.h,
              destinations: [
                NavigationDestination(
                  icon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: Image.asset(AppIcons.homeThin)),
                  selectedIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: Image.asset(AppIcons.homeFill)),
                  label: '',
                ).paddingOnly(t: 12.sp),
                NavigationDestination(
                  icon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: Image.asset(AppIcons.calendarThin)),
                  selectedIcon: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: Image.asset(AppIcons.calendarFill)),
                  label: ''
                ).paddingOnly(t: 12.sp),
              ],
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (tabIndex) => {
                tabsRouter.setActiveIndex(tabIndex),
                _fetch(tabIndex),
              },
            ),
          ),
        );
      },
    );
  }
  Future<void> _fetch(int index) async {
    logger.i(index);
    switch(index){
      case 0:
        break;
      case 1:
        di<CalendarBloc>().add(FetchCalendarDataEvent(context: _ctx, q: AppUtils.cityName, units: 'metric'));
        break;
      case 2:
        break;
    }
  }
}
