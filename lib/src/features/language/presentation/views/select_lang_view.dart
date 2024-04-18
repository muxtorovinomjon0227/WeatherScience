import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import 'package:weather_science/src/core/router/router.gr.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';
import 'package:weather_science/src/features/language/presentation/bloc/language_bloc.dart';
import '../widget/lang_menus.dart';
import '../widget/next_button.dart';

@RoutePage()
class SelectLangView extends StatelessWidget {
   SelectLangView({super.key});
  late BuildContext _ctx;
  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: _ui(context),
          ),
        );
      },
    );
  }
  Widget _ui(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommText(text: 'language.title'.tr(),fontSize: 18.sp),
        SizedBox(height: 32.sp),
        ChooseMenu().paddingSymmetric(horizontal: 16.sp),
        SizedBox(height: 64.sp),
        NextButton(onPressed: _next)
      ],
    );
  }
  Future<void> _next() async {
    await _ctx.router.push(const AuthView());
  }
}
