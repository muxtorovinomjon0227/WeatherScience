import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_outlined.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/widgets/common_text.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  const NextButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      height: 48.sp,
      width: double.infinity,
      onPressed: onPressed,
      child: CommText(text: 'language.next'.tr(),fontSize: 16.sp,textColor: AppColors.appBakColor)
    ).paddingSymmetric(horizontal: 16.sp);
  }
}
