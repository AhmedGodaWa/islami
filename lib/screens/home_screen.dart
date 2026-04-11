import 'package:flutter/material.dart';
import 'package:islami/features/hadith/hadith_tab.dart';
import 'package:islami/features/quran/quran_tab.dart';
import 'package:islami/features/radio/radio_tab.dart';
import 'package:islami/features/settings/settings_tab.dart';
import 'package:islami/features/sebha/sebha_tab.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/widgets/app_background.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> tabs = [
    const QuranTab(),
    const HadithTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(AppHelper.getBackgroundImage(context)),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.quran,
              icon: const ImageIcon(
                AssetImage('assets/images/icons/quran_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.hadith,
              icon: const ImageIcon(
                AssetImage('assets/images/icons/hadith_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.sebha,
              icon: const ImageIcon(
                AssetImage('assets/images/icons/sebha_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.radio,
              icon: const ImageIcon(
                AssetImage('assets/images/icons/radio_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.settings,
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
