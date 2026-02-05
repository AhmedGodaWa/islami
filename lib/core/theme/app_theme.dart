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

  /* =======================
      SEMANTIC COLORS - DARK
     ======================= */
  static const Color darkBackground = AppColors.darkPrimary;
  static const Color darkText = AppColors.offWhite;
  static const Color darkSelected = AppColors.gold;
  static const Color darkUnselected = AppColors.offWhite;

  // ==============================================================

  /* =======================
      THEME DATA
     ======================= */

  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,

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
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: darkBackground,

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: darkText, // العنوان والايقونات
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPrimary,
      selectedItemColor: darkSelected,
      unselectedItemColor: darkUnselected,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
