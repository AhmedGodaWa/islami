import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

class RadioControlsSection extends StatelessWidget {
  const RadioControlsSection({
    super.key,
    required this.onPlay,
    required this.isPlaying,
  });
  final VoidCallback onPlay;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    const double kControlsSpacing = 24;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.gold
              : AppColors.lightPrimary,
          iconSize: 35,
          onPressed: null,
          icon: const Icon(Icons.skip_previous),
        ),
        const SizedBox(width: kControlsSpacing),
        IconButton(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.gold
              : AppColors.lightPrimary,
          iconSize: 55,
          onPressed: onPlay,
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ),
        const SizedBox(width: kControlsSpacing),
        IconButton(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.gold
              : AppColors.lightPrimary,
          iconSize: 35,
          onPressed: null,
          icon: const Icon(Icons.skip_next),
        ),
      ],
    );
  }
}
