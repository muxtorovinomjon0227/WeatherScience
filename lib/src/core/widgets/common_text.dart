import 'package:flutter/material.dart';

import '../consts/fonst/app_fonts.dart';

class CommText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? height;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const CommText({super.key,
    required this.text,
    this.fontSize = 12,
    this.textColor,
    this.fontWeight = FontWeight.w500,
    this.height = 24/16,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        height: height,
        fontFamily: AppFonts.manrope,
      ),
      textAlign: textAlign,
    );
  }
}
