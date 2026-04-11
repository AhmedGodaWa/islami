import 'package:flutter/material.dart';
import 'package:islami/features/settings/language.dart';
import 'package:islami/features/settings/settings_provider.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageSection extends StatelessWidget {
  LanguageSection({super.key});

  final List<Language> languages = [
    Language(name: 'Endlish', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];

  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider = Provider.of<SettingsProvider>(
      context,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        DropdownButton<Language>(
          value: languages.firstWhere(
            (language) => language.code == settingsProvider.languageCode,
          ),
          items: languages
              .map(
                (language) => DropdownMenuItem<Language>(
                  value: language,
                  child: Text(language.name),
                ),
              )
              .toList(),
          onChanged: (selectedLanguage) {
            if (selectedLanguage != null) {
              settingsProvider.changeLanguage(selectedLanguage.code);
            }
          },
        ),
      ],
    );
  }
}
