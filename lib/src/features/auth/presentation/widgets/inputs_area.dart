import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/icons/app_icons.dart';
import 'package:weather_science/src/core/extensions/widget_ext.dart';
import '../../../../core/config/validators.dart';
import '../../../../core/consts/colors/app_colors.dart';
import '../../../../core/widgets/common_input.dart';

class InputsArea extends StatelessWidget {
  const InputsArea({
    required this.loginController,
    required this.passwordController,
    required this.loginFocusNode,
    required this.passwordFocusNode,
    super.key,
  });

  final TextEditingController loginController;
  final TextEditingController passwordController;
  final FocusNode loginFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonInput(
          prefix: const Icon(Icons.email_outlined),
          controller: loginController,
          placeholder: 'authView.inputEmail'.tr(),
          focusNode: loginFocusNode,
          validator: validateEmail,
          keyboardType: TextInputType.emailAddress,
        ),
        const Divider(thickness: 0.5),
        CommonInput(
          prefix: SizedBox(
              width: 24.sp,
              height: 24.sp,
              child: Image.asset(AppIcons.password)),
          controller: passwordController,
          placeholder: 'authView.inputPassword'.tr(),
          focusNode: passwordFocusNode,
          validator: validatePassword,
        ),
      ],
    ).paddingSymmetric(horizontal: 16.sp);
  }
}
