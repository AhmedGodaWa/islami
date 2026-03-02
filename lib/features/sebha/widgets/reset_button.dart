import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class ResetButton extends StatelessWidget {
  final VoidCallback onTap;
  const ResetButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(55),
              blurRadius: 8,
              offset: const Offset(0, 3.5),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'إعادة',
          style: TextTheme.of(context).titleLarge?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
