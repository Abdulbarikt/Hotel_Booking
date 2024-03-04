import 'package:flutter/material.dart';

import '../../../utils/colorconstans.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? fontSize;
  final Color? color;
  final Color? btnColor;
  final Color? fontColor;
  final bool isBorder;
  
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.color,
    this.btnColor,
    this.fontColor,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: height ?? 50,
        alignment: Alignment.center,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: btnColor ?? color ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(borderRadius ?? 23),
          border: isBorder ? Border.all(color: AppColors.kHint) : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fontColor ?? AppColors.kLightWhite,
            fontSize: fontSize ?? 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
