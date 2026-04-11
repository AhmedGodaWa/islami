import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:islami/core/theme/app_theme.dart';
import 'package:islami/features/sebha/controller/sebha_controller.dart';
import 'package:islami/features/settings/settings_provider.dart';
import 'package:islami/screens/hadith_details_screen.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/saved_hadith_screen.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await Hive.openBox('bookmarks');
  await Hive.openBox('settings');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SebhaController()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsProvider settingsProvider = Provider.of<SettingsProvider>(
      context,
    );

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
          themeMode: settingsProvider.themeMode,
        );
      },
    );
  }
}
