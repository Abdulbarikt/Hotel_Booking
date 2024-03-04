import 'package:flutter/material.dart';
import 'package:hotel_booking/app/utils/colorconstans.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: color ?? AppColors.kkPrimary, fontSize: fontSize ?? 14),
      ),
    );
  }
}