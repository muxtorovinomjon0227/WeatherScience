import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/widgets/common_text.dart';
import '../../../common/presentation/widgets/bottom_sheet.dart';

AppBar rootAppBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0.0,
    centerTitle: true,
    title: CommText(
      text: 'rootView.tabBarText'.tr(),
      fontSize: 28.sp,
      fontWeight: FontWeight.bold,
    ),
    actions: [
      InkWell(
        customBorder: const CircleBorder(),
        onTap: () async {
            searchDialog(context);
        },
        child: SizedBox(
            width: 24.sp,
            height: 24.sp,
            child: Image.asset(AppIcons.searchThin)),
      ).paddingOnly(r: 16.sp),
    ],
  );
}

