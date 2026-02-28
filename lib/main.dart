import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/screens/hadith_details_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/saved_hadith_screen.dart';
import 'package:islami/screens/sura_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('bookmarks');
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.7, 800.7),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (_) => const HomeScreen(),
            SuraDetailsScreen.routeName: (_) => const SuraDetailsScreen(),
            HadithDetailsScreen.routeName: (_) => const HadithDetailsScreen(),
            SavedHadithScreen.routeName: (_) => const SavedHadithScreen(),
          },
          initialRoute: HomeScreen.routeName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
