import 'package:flutter/cupertino.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/utils/pop_up_modal.dart';

class ProfileUtils {
  ProfileUtils._();
  static List<String> menus = [
    'drawer.logOut'
  ];

  static List<String> icons = [
    AppIcons.logout,
  ];

  static Future<void> selectMenu(BuildContext ctx, int index) async {
    switch (index) {
      case 0:
        logOut(ctx);
        break;
      case 1:
        break;
    }
  }
}
