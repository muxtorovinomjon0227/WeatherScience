import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/widgets/common_text.dart';

AppBar chooseThemeAppBar(BuildContext context) {
  return AppBar(
    scrolledUnderElevation: 0.0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(AppIcons.back).paddingOnly(l: 16.sp),
    ),
    centerTitle: true,
    title: CommText(
      text: "Выбрать тему",
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
    ),
  );
}
