import 'package:flutter/material.dart';
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
    final accentColor = Theme.of(context).colorScheme.primary;
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
            textDirection: TextDirection.ltr,
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
                            ? accentColor
                            : Theme.of(context).textTheme.titleLarge!.color,
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
                            ? accentColor
                            : Theme.of(context).textTheme.titleLarge!.color,
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
                  color: accentColor,
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
