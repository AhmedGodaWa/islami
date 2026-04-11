import 'package:flutter/material.dart';
import 'package:islami/features/settings/widgets/language_section.dart';
import 'package:islami/features/settings/widgets/theme_section.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.08),
          const ThemeSection(),
          const SizedBox(height: 16),
          LanguageSection(),
        ],
      ),
    );
  }
}
