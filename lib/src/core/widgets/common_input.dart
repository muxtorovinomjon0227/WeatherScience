import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';

class CommonInput extends StatelessWidget {
  const CommonInput({
    required this.controller,
    required this.placeholder,
    required this.focusNode,
     this.prefix,
     this.validator,
     this.keyboardType,
    super.key,
  });

  final TextEditingController controller;
  final String placeholder;
  final FocusNode focusNode;
  final Widget? prefix;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      controller: controller,
      placeholder: placeholder,
      keyboardType: keyboardType,
      prefix: prefix,
      cursorColor: AppColors.buttonColor,
      style: Theme.of(context).textTheme.displayMedium,
      focusNode: focusNode,
      padding: EdgeInsets.symmetric(
        vertical: 19.h,
      ),
      placeholderStyle: Theme.of(context).textTheme.displayMedium,
      validator: validator,
    );
  }
}
