import 'package:flutter/material.dart';

import '../../../utils/colorconstans.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap;
  const NextButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: AppColors.kPrimary, shape: BoxShape.circle),
        child: const Icon(Icons.navigate_next, size: 30, color: Colors.white),
      ),
    );
  }
}