import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/router/router.gr.dart';

@RoutePage()
class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  List<String> titles = [
    'rootView.home'.tr(),
    'rootView.calendar'.tr(),
    'rootView.search'.tr(),
  ];
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            centerTitle: true,
            leading: const SizedBox.shrink(),
            title: Text(
              titles.elementAt(tabsRouter.activeIndex),
              style: const TextStyle(
                fontSize: 15,
                height: 20/15,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: AppColors.white,
            indicatorColor: Colors.transparent,
            height: 83.h,
            destinations: [
              NavigationDestination(
                icon: Image.asset(AppIcons.homeThin),
                selectedIcon: Image.asset(AppIcons.homeFill),
                label: 'rootView.home'.tr(),
              ),
              NavigationDestination(
                icon: Image.asset(AppIcons.calendarThin),
                selectedIcon: Image.asset(AppIcons.calendarFill),
                label: 'rootView.calendar'.tr(),
              ),
              NavigationDestination(
                icon: Image.asset(AppIcons.searchThin),
                selectedIcon: Image.asset(AppIcons.searchFill),
                label: 'rootView.search'.tr(),
              ),
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
