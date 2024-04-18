import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/icons/app_icons.dart';
import '../../../../core/widgets/common_outlined.dart';
import '../../../../core/widgets/common_text.dart';
import 'lang_menus.dart';

class ChooseButton extends StatelessWidget {
  ChooseButton({
    this.buttonColor = AppColors.buttonColor,
    this.textColor = AppColors.white,
    super.key,
  });
  final Color buttonColor;
  final Color textColor;
  late BuildContext _ctx;
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return AppButton(
      width: double.infinity,
      fillColor: AppColors.appBakColor,
      height: 48.sp,
      borderColor: AppColors.appBakColor,
      onPressed: _chooseLang,
      elevation: 0,
      borderRadius: 8.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 22.sp, width: 22.sp, child: Image.asset(fl(context))),
          CommText(text: 'language.title'.tr(),textAlign: TextAlign.center,fontSize: 14.sp),
          const Icon(Icons.arrow_drop_down)
        ],
      ).paddingSymmetric(horizontal: 12.sp)
    ).paddingSymmetric(horizontal: 16.sp,vertical: 8.sp);
  }

  String fl(BuildContext context) {
    return context.locale.languageCode == 'uz'
        ? AppIcons.uzbekistan
        : context.locale.languageCode == 'ru'
            ? AppIcons.rusFlag
            : AppIcons.english;
  }

  Future<void> _chooseLang() {
    return showCupertinoModalPopup(
      context: _ctx,
      builder: (BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: CupertinoActionSheet(
            title: CommText(text: 'language.title'.tr(),textAlign: TextAlign.center,fontSize: 16.sp),
            message: ChooseMenu(),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CommText(
                    text: 'keyword.ready'.tr(),
                    textColor: AppColors.buttonColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700))),
      ),
    );
  }
}
