import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';
import 'package:weather_science/src/core/di/di.dart';
import 'package:weather_science/src/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/widgets/common_text.dart';

class SignUpOrSignIn extends StatelessWidget {
  final bool isNoRegister;
  const SignUpOrSignIn({super.key, required this.isNoRegister});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommText(
            text: !isNoRegister
                ? 'authView.notAccount'.tr()
                : 'authView.haveAccount'.tr(),
            fontSize: 16.sp),
        TextButton(
            onPressed: _sigInOrSignUp,
            child: CommText(
                text: !isNoRegister
                    ? 'authView.signUp'.tr()
                    : 'authView.signIn'.tr(),
                fontSize: 16.sp,
                textColor: AppColors.buttonColor))
      ],
    );
  }

  void _sigInOrSignUp() {
    di<AuthBloc>().add(SignUpOrSignInEvent(isNoRegister: !isNoRegister));
  }
}
