import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            isDark
                ? 'assets/images/background_image_dark.png'
                : 'assets/images/background_image.png',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}