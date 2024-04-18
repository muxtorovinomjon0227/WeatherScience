import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_outlined.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../consts/colors/app_colors.dart';

class GlobalError extends StatelessWidget {
  final String? message;
  final String? buttonTitle;
  final VoidCallback? onPressed;
  const GlobalError({super.key, this.message, this.onPressed, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommText(text: message ?? ""),
        SizedBox(height: 32.sp),
        AppButton(
          height: 48.sp,
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cached, color: AppColors.appBakColor),
              SizedBox(width: 8.sp),
              CommText(text: 'keyword.refresh'.tr(),fontSize: 16.sp,textColor: AppColors.appBakColor)
            ],
          ),
        ).paddingSymmetric(horizontal: 16.sp),
      ],
    );
  }
}
