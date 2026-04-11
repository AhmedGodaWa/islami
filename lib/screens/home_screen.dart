import 'package:flutter/material.dart';
import 'package:islami/features/hadith/hadith_tab.dart';
import 'package:islami/features/quran/quran_tab.dart';
import 'package:islami/features/radio/radio_tab.dart';
import 'package:islami/features/settings/settings_tab.dart';
import 'package:islami/features/sebha/sebha_tab.dart';
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
    SettingsTab(),
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
        appBar: AppBar(title: const Text('Islami')),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Quran',
              icon: ImageIcon(AssetImage('assets/images/icons/quran_icon.png')),
            ),
            BottomNavigationBarItem(
              label: 'Hdith',
              icon: ImageIcon(
                AssetImage('assets/images/icons/hadith_icon.png'),
              ),
            ),
            BottomNavigationBarItem(
              label: 'Sebha',
              icon: ImageIcon(AssetImage('assets/images/icons/sebha_icon.png')),
            ),
            BottomNavigationBarItem(
              label: 'Radio',
              icon: ImageIcon(AssetImage('assets/images/icons/radio_icon.png')),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
