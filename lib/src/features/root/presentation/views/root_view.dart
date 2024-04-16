import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/features/root/presentation/views/root_appbar.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/router/router.gr.dart';
import '../../../draver/presentation/views/drawer_view.dart';

@RoutePage()
class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeView(),
        CalendarView(),
        SearchView(),
      ],
      transitionBuilder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          drawer: Drawer(
              width: 300.sp,
              backgroundColor: AppColors.navBarColor,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: DrawerView()),

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
              NavigationDestination(
                icon: SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                    child: Image.asset(AppIcons.searchThin,color: AppColors.buttonColor)),
                selectedIcon: SizedBox(
                    width: 24.sp,
                    height: 24.sp,
                    child: Image.asset(AppIcons.searchFill,color: AppColors.buttonColor)),
                label: ''
              ).paddingOnly(t: 12.sp),
            ],
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: (tabIndex) => {
              tabsRouter.setActiveIndex(tabIndex),
            },
          ),
        );
      },
    );
  }
}
