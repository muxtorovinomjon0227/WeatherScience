import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_science/src/core/consts/colors/app_colors.dart';

class CommSearch extends StatelessWidget {
  const CommSearch({
    required this.controller,
    required this.placeholder,
     this.focusNode,
    super.key,
     this.onChanged,
     this.autoFocus,
  });

  final TextEditingController controller;
  final String placeholder;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool? autoFocus;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      controller: controller,
      placeholder: placeholder,
      itemColor: AppColors.buttonColor,
      focusNode: focusNode,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.displayMedium,
      autofocus: autoFocus ?? false,
      placeholderStyle: Theme.of(context).textTheme.displayMedium
    );
  }
}
