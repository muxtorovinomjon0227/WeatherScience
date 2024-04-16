import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';

class CommonInput extends StatelessWidget {
  const CommonInput({
    required this.controller,
    required this.placeholder,
    required this.errorText,
    required this.focusNode,
     this.prefix,
    super.key,
  });

  final TextEditingController controller;
  final String placeholder;
  final String errorText;
  final FocusNode focusNode;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: controller,
      placeholder: placeholder,
      prefix: prefix,
      cursorColor: AppColors.buttonColor,
      style: Theme.of(context).textTheme.displayMedium,
      focusNode: focusNode,
      padding: EdgeInsets.symmetric(
        vertical: 19.h,
      ),
      placeholderStyle: Theme.of(context).textTheme.displayMedium,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }

        return null;
      },
    );
  }
}
