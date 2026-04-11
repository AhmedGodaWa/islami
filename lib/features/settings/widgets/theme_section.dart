import 'package:flutter/material.dart';
import 'package:islami/features/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider = Provider.of<SettingsProvider>(
      context,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Dark Mode', style: Theme.of(context).textTheme.headlineSmall),
        Switch(
          value: settingsProvider.themeMode == ThemeMode.dark,
          onChanged: (value) {
            settingsProvider.changeTheme(
              value ? ThemeMode.dark : ThemeMode.light,
            );
          },
        ),
      ],
    );
  }
}
