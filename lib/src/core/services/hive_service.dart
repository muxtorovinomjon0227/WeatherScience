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
  static bool greenTheme() {
    AppUtils.blueTheme = box.get(BoxConst.themeKey) ?? false;
    return AppUtils.blueTheme;
  }
  static Future<void> removeTheme() async {
    await box.delete(BoxConst.themeKey);
  }

  static Future<void> saveCity(String cityName) async {
    await box.put(BoxConst.cityKey, cityName);
  }
  static String getCity() {
    AppUtils.cityName = box.get(BoxConst.cityKey) ?? "Tashkent";
    return AppUtils.cityName;
  }
  static Future<void> removeCity() async {
    await box.delete(BoxConst.cityKey);
  }


  static Future<void> saveOneDayWeather(Map<String, dynamic> data) async {
    await box.put(BoxConst.oneDayWeather, data);
  }
  static Future<Map<String, dynamic>> getOneDayWeather() async {
    var data = await box.get(BoxConst.oneDayWeather);
    return data;
  }
  static Future<void> removeOneDayWeather() async {
    await box.delete(BoxConst.oneDayWeather);
  }


  static Future<void> saveFiveDaysWeather(Map<String, dynamic> data) async {
    await box.put(BoxConst.oneDayWeather, data);
  }
  static Future<Map<String, dynamic>> getFiveDaysWeather() async {
    var data = await box.get(BoxConst.oneDayWeather);
    return data;
  }
  static Future<void> removeFiveDaysWeather() async {
    await box.delete(BoxConst.oneDayWeather);
  }

  static Future<void> saveVerifiedUser(bool isVerifiedUser) async {
    await box.put(BoxConst.verifiedUserKey, isVerifiedUser);
  }
  static Future<bool> isVerifiedUser() async {
    var data = await box.get(BoxConst.verifiedUserKey) ?? false;
    return data;
  }
  static Future<void> removeVerifiedUser() async {
    await box.delete(BoxConst.verifiedUserKey);
  }
}