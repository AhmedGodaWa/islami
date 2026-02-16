import 'package:flutter/material.dart';
import 'package:qcf_quran/qcf_quran.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  late int firstPage;
  int? currentPage;
  bool showOverlay = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (currentPage == null) {
      final args =
          ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;

      firstPage = getPageNumber(args.index + 1, 1);
      currentPage = firstPage;
    }
  }

  void toggleOverlay() {
    setState(() {
      showOverlay = !showOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    String surahName = "";
    if (currentPage != null) {
      final pageData = getPageData(currentPage!);
      final surahNumber = int.parse(pageData.first['surah'].toString());
      surahName = getSurahNameArabic(surahNumber);
    }

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppTheme.lightBackground,
      //   elevation: 0,
      //   title: Text(args.suraName, style: const TextStyle(color: Colors.black)),
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      body: GestureDetector(
        onTap: toggleOverlay,
        child: Stack(
          children: [
            PageviewQuran(
              initialPageNumber: firstPage,
              onPageChanged: (page) {
                setState(() {
                  currentPage = page;
                });
              },
            ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: showOverlay ? 0 : -80,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الصفحة $currentPage",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        surahName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuraDetailsArgs {
  final String suraName;
  final int index;

  SuraDetailsArgs({required this.suraName, required this.index});
}
