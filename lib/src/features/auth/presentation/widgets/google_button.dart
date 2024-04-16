import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import 'package:weather_science/src/core/consts/icons/app_icons.dart';
import 'package:weather_science/src/core/widgets/common_outlined.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    required this.onRegister,
    super.key,
  });
  final Future<void> Function() onRegister;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      width: 48.sp,
      height: 48.sp,
      onPressed: onRegister,
      fillColor: AppColors.appBakColor,
      child: Center(
          child: SizedBox(
              width: 32.sp, height: 32.sp, child: Image.asset(AppIcons.google))),
    );
  }
}
