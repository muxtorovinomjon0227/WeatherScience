import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/decoration.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../../../../core/consts/colors/app_colors.dart';
import '../../../../../../../core/consts/icons/app_icons.dart';
import '../../../../../../../core/utils/loader.dart';
import '../../data/models/remote/month_temp/month_temp_model.dart';

class CardTemp extends StatelessWidget {
  final ListElement element;
  final String country;
  const CardTemp({super.key, required this.element, required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: deco15Rad,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _temp(),
          _icon(),
          _date(),
        ],
      ).paddingAll(8.sp),
    ).paddingOnly(t: 8.sp,l: 16.sp,r: 16.sp);
  }

  Widget _temp(){
    return Column(
      children: [
        CommText(text: "${element.main?.temp?.truncate() ?? 0}°",fontSize: 64.sp,fontWeight: FontWeight.bold),
        CommText(text: element.weather?.first.main ?? "",fontSize: 16.sp),
        CommText(text: country,fontSize: 16.sp),
      ],
    );
  }

  Widget _date(){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(element.dt_txt ?? "2024-07-17 00:00:00");
    var formatter =  DateFormat('yyyy-MM-dd');
    String hour = DateFormat('kk:mm').format(dateTime);
    String year = formatter.format(dateTime);
    return Column(
      children: [
        CommText(text: hour,fontSize: 20.sp,fontWeight: FontWeight.bold),
        CommText(text: year,fontSize: 14.sp,),
      ],
    );
  }


  Widget _icon() {
    return CachedNetworkImage(
      width: 100.sp,
      height: 100.sp,
      imageUrl: "http://openweathermap.org/img/w/${element.weather?.first.icon ?? ""}.png",
      fit: BoxFit.fill,
      placeholder: (context, url) => buttonLoader,
      errorWidget: (context, url, error) => CircleAvatar(
        backgroundColor: AppColors.cardColor,
        child: ClipOval(
          child: Image.asset(AppIcons.defaultIcon).paddingAll(16.sp),
        ),
      ),
    );
  }
}
