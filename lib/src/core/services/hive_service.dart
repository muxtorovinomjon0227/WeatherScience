import 'package:hive/hive.dart';

import '../consts/box/box_const.dart';
import '../utils/app_utils.dart';

class HiveService {
  HiveService._();

  static Future<void> initHive() async {
    await Hive.openBox('AppBox');
  }
  static final box = Hive.box('AppBox');

  static Future<void> saveTheme(bool isDark) async {
    await box.put(BoxConst.themeKey, isDark);
  }
  static bool getIsDark() {
    AppUtils.blueTheme = box.get(BoxConst.themeKey) ?? false;
    return AppUtils.blueTheme;
  }
  static Future<void> removeTheme() async {
    await box.delete(BoxConst.themeKey);
  }
}