import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/colors/app_colors.dart';
import '../consts/fonst/app_fonts.dart';

class AppThemes {
  static const int _primaryColor = 0xFF6366F1;
  static const MaterialColor primarySwatch =
  MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFF10284c),
    100: Color(0xFF10284c),
    200: Color(0xFF10284c),
    300: Color(0xFF10284c),
    400: Color(0xFF10284c),
    500: Color(_primaryColor),
    600: Color(0xFF10284c),
    700: Color(0xFF10284c),
    800: Color(0xFF10284c),
    900: Color(0xFF10284c),
  });

  static const int _textColor = 0xFF000000;
  static const MaterialColor textSwatch =
  MaterialColor(_textColor, <int, Color>{
    50: Color(0xFFc9f5fe),
    100: Color(0xFFc9f5fe),
    200: AppColors.appBakColor,
    300: Color(0xFFc9f5fe),
    400: Color(0xFFc9f5fe),
    500: Color(_textColor),
    600: Color(0xFFc9f5fe),
    700: Color(0xFFc9f5fe),
    800: Color(0xFFc9f5fe),
    900: Color(0xFFc9f5fe),
  });

  static final blueTheme = ThemeData(
    brightness: Brightness.light,
    dividerTheme: const DividerThemeData(color: AppColors.textColor),
    scaffoldBackgroundColor: AppColors.appBakColor,
    cardColor: AppColors.cardColor,
    dialogTheme: const DialogTheme(backgroundColor: AppColors.appBakColor,elevation: 6),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.cardColor),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.buttonColor),
    iconTheme: IconThemeData(color: AppColors.textColor,size: 24.sp),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.navBarColor,iconTheme: IconThemeData(color: AppColors.textColor,size: 26.sp),),
    dividerColor: AppColors.textColor,
    fontFamily: AppFonts.manrope,
    textTheme: TextTheme(
      displayMedium: TextStyle(
          color: textSwatch.shade700,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.manrope,
          fontSize: 14.sp
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(surface: textSwatch.shade100),
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.navBarColor),
  );

  static final greenTheme = blueTheme.copyWith(
    brightness: Brightness.light,
    dialogTheme: const DialogTheme(backgroundColor: AppColors.appBakColor,elevation: 6),
    dividerTheme: const DividerThemeData(color: AppColors.textColor),
    scaffoldBackgroundColor: AppColors.appBakColor,
    cardColor: AppColors.cardColor,
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: AppColors.cardColor),
    buttonTheme: const ButtonThemeData(buttonColor: AppColors.buttonColor),
    iconTheme: IconThemeData(color: AppColors.textColor, size: 24.sp),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.navBarColor,iconTheme: IconThemeData(color: AppColors.textColor,size: 26.sp),),
    dividerColor: AppColors.textColor,
    textTheme: TextTheme(
      displayMedium: TextStyle(
          color: textSwatch.shade700,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.manrope,
          fontSize: 14.sp
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatch).copyWith(surface: textSwatch.shade100),
    bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.navBarColor),
  );
}
