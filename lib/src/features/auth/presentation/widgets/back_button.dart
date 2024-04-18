import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/icons/app_icons.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';


class BackButton extends StatelessWidget {
  const BackButton({required this.onBack, super.key});
  final Future<void> Function() onBack;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        onPressed: onBack,
        icon: Image.asset(AppIcons.back),
      ),
    ).paddingOnly(t: 48.sp,l: 16.sp);
  }
}
