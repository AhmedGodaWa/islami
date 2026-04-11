import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SettingsProvider with ChangeNotifier {
  static const String themeKey = 'theme';
  static const String languageKey = 'language';

  ThemeMode themeMode = ThemeMode.light;
  String languageCode = 'en';

  final Box settingsBox = Hive.box('settings');

  SettingsProvider() {
    loadSettings();
  }

  void loadSettings() {
    // read theme
    String? savedTheme = settingsBox.get(themeKey);

    if (savedTheme != null) {
      themeMode = ThemeMode.values.firstWhere(
        (mode) => mode.name == savedTheme,
      );
    }

    // read language
    String? savedLanguage = settingsBox.get(languageKey);

    if (savedLanguage != null) {
      languageCode = savedLanguage;
    }
  }

  void changeTheme(ThemeMode selectedTheme) {
    // avoid unnecessary rebuild
    if (themeMode == selectedTheme) return;

    themeMode = selectedTheme;

    // save in Hive
    settingsBox.put(themeKey, selectedTheme.name);

    notifyListeners();
  }

  void changeLanguage(String selectedLanguage) {
    // avoid unnecessary rebuild
    if (languageCode == selectedLanguage) return;

    languageCode = selectedLanguage;

    // save in Hive
    settingsBox.put(languageKey, selectedLanguage);

    notifyListeners();
  }
}
