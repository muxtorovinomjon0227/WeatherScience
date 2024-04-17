import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import 'package:weather_science/src/features/common/presentation/views/search_sheet.dart';
import '../cubit/cubit.dart';

void searchDialog(BuildContext context,) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.appBakColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(12.sp)),
    ),
    builder: (context) {
      return FractionallySizedBox(
          heightFactor: 0.95,
          child: BlocProvider(
            create: (context) => CitySearchCubit(),
            child: SearchSheet(),
          ),
      );
    },
  );
}