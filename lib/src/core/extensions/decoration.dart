import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../consts/colors/app_colors.dart';
import '../utils/app_utils.dart';

Decoration deco15Rad =  BoxDecoration(color: AppColors.cardColor,borderRadius: BorderRadius.circular(15.sp));
EdgeInsetsGeometry margin15All = EdgeInsets.all(15.sp);
EdgeInsetsGeometry margin15Only({double? l, double? r, double? t, double? b}){
  return EdgeInsets.only(left: l?? 0, right: r?? 0,bottom: b?? 0,top: t?? 0);
}
