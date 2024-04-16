import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/consts/images/images.dart';
import '../../../../core/services/hive_service.dart';
import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/common_outlined.dart';
import '../cubit/theme_cubit.dart';
import '../cubit/theme_state.dart';
import '../widgets/appbar.dart';

@RoutePage()
class ChooseThemeView extends StatelessWidget {
  const ChooseThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _appBar(context),
          body: _ui(context, state.themeData),
        );
      },
    );
  }

  Widget _ui(BuildContext context, ThemeData themeData) {
    return Row(
      children: [
        cards(
            im: AppImages.light,
            mode: AppThemes.blueTheme,
            ctx: context,
            themeData: themeData),
        cards(
            im: AppImages.dark,
            mode: AppThemes.greenTheme,
            ctx: context,
            themeData: themeData),
      ],
    ).paddingOnly(t: 56.sp);
  }

  Widget cards({required String im, required ThemeData mode, required BuildContext ctx, required ThemeData themeData}) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(width: double.infinity, height: 300.sp, child: Image.asset(im)),
          SizedBox(height: 32.sp),
          AppButton(
            onPressed: (){
              _changeTheme(ctx,mode);
            },
            height: 48.sp,
            borderWidth: 2,
            borderColor: themeData == mode ? AppColors.appBakColor : Theme.of(ctx).cardColor,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mode == AppThemes.blueTheme
                    ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
                SizedBox(width: 8.sp),
                Text(mode == AppThemes.blueTheme ? "Свет" : "Темный",
                    style: Theme.of(ctx).textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
          ).paddingOnly(l: 16.sp, r: 16.sp),
        ],
      ),
    );
  }

  Future<void> _changeTheme(BuildContext ctx,ThemeData themeData) async {
   await HiveService.saveTheme(themeData == AppThemes.greenTheme ? true : false);
   HiveService.getIsDark();
   if(ctx.mounted){
     ctx.read<ThemeCubit>().getTheme(ThemeState(themeData));
   }
  }

  AppBar _appBar(BuildContext context) {
    return chooseThemeAppBar(context);
  }
}
