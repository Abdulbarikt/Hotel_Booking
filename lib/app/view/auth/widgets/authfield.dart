
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/colorconstans.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String icon;
  final Color iconColor;
  final String hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AuthField({
    Key? key,
    required this.iconColor,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(fontSize: 14, color: Colors.black),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.kkPrimary,
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: AppColors.kLightWhite2,
        filled: true,
        errorMaxLines: 3,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor,
            ),
            child: SvgPicture.asset(icon),
          ),
        ),
      ),
    );
  }
}
