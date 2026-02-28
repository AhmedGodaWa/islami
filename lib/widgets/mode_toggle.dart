import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/features/hadith/hadith_mode.dart';

class ModeToggle extends StatelessWidget {
  const ModeToggle({
    super.key,
    required this.selectedMode,
    required this.onTap,
    required this.firstLabel,
    required this.secondLabel,
  });

  final HadithMode selectedMode;
  final Function(HadithMode) onTap;
  final String firstLabel;
  final String secondLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.offWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onTap(HadithMode.online),
                  child: Center(
                    child: Text(
                      firstLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: selectedMode == HadithMode.online
                            ? AppColors.lightPrimary
                            : AppColors.offDark,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => onTap(HadithMode.offline),
                  child: Center(
                    child: Text(
                      secondLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: selectedMode == HadithMode.offline
                            ? AppColors.lightPrimary
                            : AppColors.offDark,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedAlign(
            alignment: selectedMode == HadithMode.offline
                ? Alignment.bottomRight
                : Alignment.bottomLeft,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOutBack,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                height: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.lightPrimary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
