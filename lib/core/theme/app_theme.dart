import 'package:flutter/material.dart';
import 'app_colors.dart';

/*

light mode =>
────────────
background color  -> offwhite
text              -> offDark
selected          -> offDark
unSelected        -> offWhite

----------------------------------

Dark mode =>
────────────
background color  -> darkPrimary
text              -> offWhite
selected          -> gold
unSelected        -> offWhite

*/

class AppTheme {
  /* =======================
      SEMANTIC COLORS - LIGHT
     ======================= */

  static const Color lightBackground = AppColors.offWhite;
  static const Color lightText = AppColors.offDark;
  static const Color lightSelected = AppColors.offDark;
  static const Color lightUnselected = AppColors.offWhite;
  static const Color lightCard = AppColors.offWhite;
  static const Color lightAccent = AppColors.lightPrimary;

  /* =======================
      SEMANTIC COLORS - DARK
     ======================= */
  static const Color darkBackground = AppColors.darkPrimary;
  static const Color darkText = AppColors.offWhite;
  static const Color darkSelected = AppColors.gold;
  static const Color darkUnselected = AppColors.offWhite;
  static const Color accent = AppColors.gold;
  static const Color darkCard = Color(0xFF1E2A44);
  // ==============================================================

  /* =======================
      THEME DATA
     ======================= */

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    cardColor: lightCard,
    iconTheme: const IconThemeData(color: AppColors.lightPrimary),
    dividerTheme: const DividerThemeData(color: AppColors.lightPrimary),
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.lightPrimary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: lightText,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimary,
      selectedItemColor: lightSelected,
      unselectedItemColor: lightUnselected,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 28),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: lightText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: lightText,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    cardColor: darkCard,
    dividerTheme: const DividerThemeData(color: accent),
    iconTheme: const IconThemeData(color: accent),
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark().copyWith(primary: AppColors.gold),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: darkText,
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPrimary,
      selectedItemColor: darkSelected,
      unselectedItemColor: darkUnselected,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 28),
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: darkText,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: darkText,
      ),
    ),
  );
}
