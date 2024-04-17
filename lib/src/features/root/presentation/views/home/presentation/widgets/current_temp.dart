import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import '../../../../../../../core/consts/icons/app_icons.dart';
import '../../../../../../../core/utils/loader.dart';
import '../../data/models/remote/current_day/current_day_model.dart';

class CurrentTemp extends StatelessWidget {
  final CurrentDayModel dayModel;
  const CurrentTemp({super.key, required this.dayModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _icon(),
        _temp(),
      ],
    );
  }

  Widget _icon() {
    return CachedNetworkImage(
      width: 180.sp,
      height: 180.sp,
      imageUrl: "http://openweathermap.org/img/w/${dayModel.weather?.first.icon ?? ""}.png",
      fit: BoxFit.fill,
      placeholder: (context, url) => buttonLoaderColor,
      errorWidget: (context, url, error) => CircleAvatar(
        child: ClipOval(
          child: Image.asset(AppIcons.avatar).paddingAll(16.sp),
        ),
      ),
    );
  }
  Widget _temp(){
    return Column(
      children: [
        CommText(text: "${dayModel.main?.temp?.truncate() ?? 0}°C",fontSize: 64.sp,fontWeight: FontWeight.bold),
        CommText(text: dayModel.weather?.first.main ?? "",fontSize: 20.sp,fontWeight: FontWeight.bold),
        CommText(text: dayModel.name ?? "",fontSize: 20.sp,fontWeight: FontWeight.bold),
      ],
    );
  }
}
