import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/utils/loader.dart';

class DialogUtils {
  DialogUtils._();

  static late BuildContext ctx;

  static void showLoading(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        ctx = context;
        return Center(
          child: Container(
              width: 100.0.sp,
              height: 100.0.sp,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: buttonLoaderColor),
        );
      },
    );
  }
  static void popDialog(){
    Navigator.pop(ctx);
  }
}
