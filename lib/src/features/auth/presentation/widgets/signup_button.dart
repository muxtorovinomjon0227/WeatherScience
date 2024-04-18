import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_outlined.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    required this.signUp,
    super.key,
  });
  final Future<void> Function() signUp;
  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: signUp,
      width: double.infinity,
      height: 48.sp,
      child: Center(
        child: CommText(
            text: 'authView.signUp'.tr(),
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
          textColor: AppColors.appBakColor,
        ),
      )
    ).paddingSymmetric(horizontal: 16.sp);
  }
}
