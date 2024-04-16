import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import '../../../../core/widgets/common_text.dart';

class Register extends StatelessWidget {
  final VoidCallback onPressed;
  const Register({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommText(text: 'authView.notAccount'.tr(),fontSize: 16.sp),
        TextButton(onPressed: onPressed, child: CommText(text: 'authView.signUp'.tr(),fontSize: 16.sp,textColor: AppColors.buttonColor))
      ],
    );
  }
}
