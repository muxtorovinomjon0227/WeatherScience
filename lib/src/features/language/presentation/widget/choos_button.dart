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
      width: 54.sp,
      height: 28.sp,
      onPressed: _chooseLang,
      fillColor: AppColors.buttonColor,
      elevation: 0,
      borderRadius: 20.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 22.sp, width: 22.sp, child: Image.asset(fl(context))),
          SvgPicture.asset(AppIcons.logout).paddingOnly(r: 6.w),
        ],
      ).paddingOnly(l: 6.sp),
    );
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
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text("Выберите язык", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
        message: ChooseMenu(),
        cancelButton: CupertinoActionSheetAction(
            onPressed: () { Navigator.pop(context); },
            child: CommText(text: "Отмена",textColor: AppColors.red,fontSize: 14.sp,fontWeight: FontWeight.w700))
      ),
    );
  }
}
