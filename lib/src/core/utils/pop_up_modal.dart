import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../consts/colors/app_colors.dart';

Future<void> popUp(
  BuildContext context, {
  required String error,
}) {
  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
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
      );
    },
  );
}
