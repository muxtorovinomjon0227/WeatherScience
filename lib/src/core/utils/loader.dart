import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../consts/colors/app_colors.dart';

Widget buttonLoader = const CupertinoActivityIndicator(
  radius: 20,
  color: AppColors.white,
);
Widget buttonLoaderColor = const CupertinoActivityIndicator(
  radius: 30,
  color: AppColors.white,
);
Widget cupertinoProgress = const CupertinoActivityIndicator(
  radius: 30,
  color: AppColors.appBakColor,
);

Widget divider = const Divider(height: 1);