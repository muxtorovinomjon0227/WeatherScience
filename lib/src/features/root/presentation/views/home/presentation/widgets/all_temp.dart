import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../../../../core/extensions/decoration.dart';
import '../../../../../../../core/widgets/common_text.dart';
import '../../data/models/remote/current_day/current_day_model.dart';

class AllTemperatures extends StatelessWidget {
  final CurrentDayModel dayModel;
  final ScrollController controller;
  const AllTemperatures({super.key, required this.dayModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommText(text: 'homeView.today'.tr(),fontSize: 20.sp,fontWeight: FontWeight.bold).paddingOnly(l: 16.sp),
        SizedBox(height: 4.sp),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          child: Row(
            children: [
              SizedBox(width: 16.sp),
              _card(center: "${dayModel.main?.feels_like?.truncate() ?? 0} °C", bottom: 'homeView.like'.tr()),
              SizedBox(width: 8.sp),
              _card(center: "${dayModel.main?.temp_min?.truncate() ?? 0} °C", bottom: 'homeView.min'.tr()),
              SizedBox(width: 8.sp),
              _card(center: "${dayModel.main?.temp_max?.truncate() ?? 0} °C", bottom: 'homeView.max'.tr()),
              SizedBox(width: 16.sp),
            ],
          ),
        ),
      ],
    );
  }
  Widget _card({required String center, required String bottom}){
    return Container(
      height: 89.sp,
      width: 145.sp,
      decoration: deco15Rad,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommText(text: center,fontWeight: FontWeight.bold,fontSize: 20.sp),
          CommText(text: bottom,fontSize: 16.sp),
        ],
      ),
    );
  }
}
