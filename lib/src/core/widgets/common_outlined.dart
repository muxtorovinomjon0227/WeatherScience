import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts/colors/app_colors.dart';

class AppButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? elevation;
  final double? borderWidth;
  final Color? borderColor;
  final Color? fillColor;
  const AppButton(
      {super.key,
        this.onPressed,
        this.child,
        this.height,
        this.width,
        this.borderColor,
        this.fillColor,
        this.borderRadius, this.elevation, this.borderWidth});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  late bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: RawMaterialButton(
        highlightColor: AppColors.textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.sp),
          side: BorderSide(color: widget.borderColor ?? AppColors.buttonColor,width: widget.borderWidth ?? 0),
        ),
        onHighlightChanged: (val) {
          setState(() {
            pressed = !pressed;
          });
        },
        fillColor: widget.fillColor ?? AppColors.buttonColor,
        elevation: widget.elevation ?? 0.2,
        onPressed: widget.onPressed,
        child: widget.child,
      ),
    );
  }
}
