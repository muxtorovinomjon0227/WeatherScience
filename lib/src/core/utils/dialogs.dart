import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/utils/loader.dart';

class DialogUtils {
  DialogUtils._();

  static late BuildContext dialogContext;

  static void showLoading(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        dialogContext = context;
        return Center(
          child: Container(
              width: 100.0.sp,
              height: 100.0.sp,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: buttonLoader),
        );
      },
    );
  }
  static void popDialog(){
    Navigator.pop(dialogContext);
  }
}
