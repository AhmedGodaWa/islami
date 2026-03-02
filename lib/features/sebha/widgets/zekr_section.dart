import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class ZekrSection extends StatelessWidget {
  final String? zekr;
  final VoidCallback onTap;

  const ZekrSection({super.key, this.zekr, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget content;

    /// ===== حالة عدم وجود ذكر =====
    if (zekr == null) {
      content = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: AppColors.lightPrimary, size: 20),
          const SizedBox(width: 6),
          Text(
            'إضافة ذكر',
            style: TextTheme.of(
              context,
            ).titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
    /// ===== حالة وجود ذكر =====
    else {
      content = Container(
        padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.lightPrimary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(55),
              blurRadius: 8,
              offset: const Offset(0, 3.5),
            ),
          ],
        ),
        child: Text(
          zekr!,
          style: TextTheme.of(
            context,
          ).titleLarge?.copyWith(color: Colors.white),
        ),
      );
    }
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: content,
    );
  }
}
