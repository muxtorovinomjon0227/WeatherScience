import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors/app_colors.dart';
import '../router/router.gr.dart';
import '../widgets/common_text.dart';
import 'dialogs.dart';

Future<void> popUp(BuildContext context, {required String error,}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: CommText(
            text: 'keyword.oops'.tr(),
             textColor: AppColors.red,
             textAlign: TextAlign.center,
             fontWeight: FontWeight.w700,
          ),
          content: Text(error),
          actions: <Widget>[
            CupertinoDialogAction(
              child: CommText(
                  text:'keyword.ok'.tr(),
                textColor: AppColors.buttonColor,
              ),
              onPressed: () {
                Navigator.pop(Loaders.ctx);
                context.router.pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Future<void> connectPopUp(BuildContext context){
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return Theme(
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: CommText(
            text: 'keyword.oops'.tr(),
             textColor: AppColors.red,
             textAlign: TextAlign.center,
             fontWeight: FontWeight.w700,
          ),
          content: CommText(
              text: 'keyword.connectMessage'.tr()),
          actions: <Widget>[
            CupertinoDialogAction(
              child: CommText(
                  text:'keyword.offline'.tr(),
                textColor: AppColors.red,
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
            CupertinoDialogAction(
              child: CommText(
                  text:'keyword.connect'.tr(),
                textColor: AppColors.buttonColor,
              ),
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
        data: ThemeData.dark(),
        child: CupertinoAlertDialog(
          title: CommText(
              text: 'drawer.attention'.tr(),
              textColor: AppColors.red,
              textAlign: TextAlign.center,
              fontSize: 18.sp),
          content: CommText(
              text: 'drawer.logOutMessage'.tr(),
              textAlign: TextAlign.center,
              textColor: AppColors.textColor,
              fontWeight: FontWeight.w400),
          actions: <Widget>[
            CupertinoDialogAction(
              child: CommText(
                text: 'drawer.cancel'.tr(),
                textColor: AppColors.buttonColor,
              ),
              onPressed: () {
                context.router.pop();
              },
            ),
            CupertinoDialogAction(
              child: CommText(
                  text: 'drawer.logOut'.tr(), textColor: AppColors.red),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if(context.mounted){
                  context.router.push(const AuthView());
                }
              },
            ),
          ],
        ),
      );
    },
  );
}