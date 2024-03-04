import 'package:flutter/material.dart';

import '../../../utils/colorconstans.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;
  const SkipButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 36,
        color: AppColors.kAccent4,
        child: TextButton(
          onPressed: onTap,
          child: const Text(
            'Skip',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
      ),
    );
  }
}