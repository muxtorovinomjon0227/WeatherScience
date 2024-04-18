import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/di/di.dart';
import '../../../../core/widgets/common_outlined.dart';
import '../bloc/language_bloc.dart';

class ChooseMenu extends StatelessWidget {
  ChooseMenu({super.key});
  late BuildContext _ctx;

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Column(
      children: [
        SizedBox(height: 16.sp),
        _card(
            name: "O'zbekcha",
            flag: AppIcons.uzbekistan,
            currenCode: context.locale.languageCode,
            langCode: 'uz'),
        SizedBox(height: 8.sp),
        _card(
            name: "Русский",
            flag: AppIcons.rusFlag,
            currenCode: context.locale.languageCode,
            langCode: 'ru'),
        SizedBox(height: 8.sp),
        _card(
            name: "English",
            flag: AppIcons.english,
            currenCode: context.locale.languageCode,
            langCode: 'en'),
      ],
    );
  }

  Widget _card({required String currenCode, required String flag, required String name, required String langCode}) {
    return AppButton(
      borderColor: currenCode == langCode ? AppColors.buttonColor : AppColors.cardColor,
      height: 48.sp,
      borderWidth: 1.2,
      fillColor: AppColors.cardColor,
      width: double.infinity,
      onPressed: () {
        _onChanged(langCode);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 22.sp, height: 22.sp, child: Image.asset(flag)),
          CommText(text: name,fontSize: 14.sp),
          _icon(currenCode == langCode),
        ],
      ).paddingSymmetric(horizontal: 12.sp),
    );
  }

  void _onChanged(String code) async {
    switch (code) {
      case "uz":
        di<LanguageBloc>().add(ChangeLangEvent(_ctx, const Locale('uz')));
        break;
      case "ru":
         di<LanguageBloc>().add(ChangeLangEvent(_ctx, const Locale('ru')));
        break;
      case "en":
        di<LanguageBloc>().add(ChangeLangEvent(_ctx, const Locale('en')));
        break;
    }
  }

  Widget _icon(bool on) {
    return on
        ? const Icon(Icons.radio_button_on, color: AppColors.buttonColor)
        : const Icon(Icons.radio_button_off, color: AppColors.appBakColor);
  }
}
