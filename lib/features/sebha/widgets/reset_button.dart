import 'package:flutter/material.dart';


class ResetButton extends StatelessWidget {
  final VoidCallback onTap;
  const ResetButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
