import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/icons/app_icons.dart';
import 'package:weather_science/src/core/widgets/common_text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppIcons.splashLogo),
        CommText(text: 'authView.welcome'.tr(),fontSize: 20.sp)
      ],
    );
  }
}
