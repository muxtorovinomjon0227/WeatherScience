import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors/app_colors.dart';
import '../router/router.gr.dart';
import '../widgets/common_text.dart';

Future<void> popUp(
  BuildContext context, {
  required String error,
}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData(
            dialogTheme: const DialogTheme(
              shadowColor: AppColors.appBakColor,
              backgroundColor: AppColors.appBakColor,)),
        child: CupertinoAlertDialog(
          title: Text(
            'oops'.tr(),
            style: const TextStyle(color: AppColors.red),
          ),
          content: Text(error),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('ok'.tr()),
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Future<void> logOut(BuildContext context) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData(
          dialogTheme: const DialogTheme(
            shadowColor: AppColors.appBakColor,
            backgroundColor: AppColors.appBakColor,)),
        child: CupertinoAlertDialog(
          title: CommText(
              text: 'drawer.attention'.tr(),
              textColor: AppColors.red,
              textAlign: TextAlign.center,
              fontSize: 18.sp),
          content: CommText(
              text: 'drawer.logOutMessage'.tr(),
              textAlign: TextAlign.center,
              textColor: AppColors.navBarColor,
              fontWeight: FontWeight.w400),
          actions: <Widget>[
            CupertinoDialogAction(
              child: CommText(
                text: 'drawer.cancel'.tr(),
                textColor: AppColors.appBakColor,
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
            CupertinoDialogAction(
              child: CommText(
                  text: 'drawer.logOut'.tr(), textColor: AppColors.red),
              onPressed: () {
                context.router.push(const AuthView());
              },
            ),
          ],
        ),
      );
    },
  );
}