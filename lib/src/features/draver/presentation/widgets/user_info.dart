import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import 'package:weather_science/src/core/consts/icons/app_icons.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/utils/app_utils.dart';
import 'package:weather_science/src/core/utils/loader.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';

class UserIfo extends StatelessWidget {
  const UserIfo({super.key});

  @override
  Widget build(BuildContext context) {
    return _userInfo();
  }

  Widget _userInfo() {
    return Container(
      color: AppColors.appBakColor,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 40.sp),
          _avatar(),
          SizedBox(height: 16.sp),
          CommText(text: AppUtils.user.displayName ?? "", fontSize: 16.sp),
          CommText(text: AppUtils.user.email ?? ""),
          SizedBox(height: 16.sp),
        ],
      ),
    );
  }

  Widget _avatar() {
    return ClipOval(
      child: CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: AppUtils.user.photoURL ?? "",
        fit: BoxFit.fill,
        placeholder: (context, url) => buttonLoaderColor,
        errorWidget: (context, url, error) => CircleAvatar(
            radius: 100.sp,
            child: ClipOval(
                child: Image.asset(AppIcons.avatar).paddingAll(16.sp))),
      ).paddingAll(0),
    );
  }
}
