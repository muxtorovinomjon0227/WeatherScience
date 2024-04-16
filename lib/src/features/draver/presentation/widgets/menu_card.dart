import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/widgets/common_outlined.dart';
import '../../../../core/widgets/common_text.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String icon;
  final String title;
  final int? index;
  const MenuCard(
      {super.key,
      this.onTap,
      required this.icon,
      required this.title,
      this.index});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 48.sp,
      onPressed: onTap,
      elevation: 0,
      fillColor: AppColors.appBakColor,
      borderColor: AppColors.appBakColor,
      child: Row(
        children: [
          SizedBox(width: 16.sp),
          SizedBox(
              width: 32.sp,
              height: 32.sp,
              child: Image.asset(icon)),
          SizedBox(width: 16.sp),
          CommText(
            text: title,
            fontSize: 14.sp,
            textColor: index == 1 ? AppColors.red : null,
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 16.sp, vertical: 4.sp);
  }
}
