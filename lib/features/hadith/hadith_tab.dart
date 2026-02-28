import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/features/hadith/hadith_list_item.dart';
import 'package:islami/features/hadith/hadith_mode.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/screens/saved_hadith_screen.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:islami/widgets/mode_toggle.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});
  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  HadithMode selectedMode = HadithMode.offline;
  List<HadithModel> hadithList = [];
  bool isLoading = true;
  int _requestId = 0;
  final HadithRepository _repository = HadithRepository.instance;
  @override
  void initState() {
    super.initState();
    loadHadith();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ModeToggle(
            selectedMode: selectedMode,
            onTap: (mode) async {
              selectedMode = mode;
              setState(() {
                isLoading = true;
              });
              await loadHadith();
            },
            firstLabel: 'Online',
            secondLabel: 'Offline',
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 8,
              right: 16,
              left: 16,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.offWhite,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                    color: Colors.black.withAlpha(50),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SavedHadithScreen.routeName,
                            );
                          },
                          icon: const Icon(Icons.bookmark_border),
                        ),
                        Text(
                          'الأحاديث',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),

                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () async {
                            await loadHadith(); // هيجيب random جديد
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 2.4, color: AppColors.lightPrimary),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: isLoading
                          ? const LoadingIndicator()
                          : ListView.builder(
                              itemCount: hadithList.length,
                              itemBuilder: (_, index) => HadithListItem(
                                hadith: hadithList[index],
                                index: index,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadHadith() async {
    final int requestId = ++_requestId;
    try {
      final result = await _repository.loadHadith(selectedMode);
      // لو فيه request أحدث → تجاهل النتيجة
      if (requestId != _requestId) return;

      hadithList = result;
    } catch (e) {
      debugPrint('Error loading hadith: $e');
    }

    isLoading = false;

    setState(() {});
  }

  // Future<void> loadHadithFile() async {
  //   final String fileContent = await rootBundle.loadString(
  //     'assets/texts/ahadeth.txt',
  //   );
  //   List<String> hadithString = fileContent.split('#');
  //   hadithString = hadithString.where((e) => e.trim().isNotEmpty).toList();
  //   //hadithString.removeWhere((e) => e.trim().isEmpty);
  //   hadithList = hadithString.map((contentString) {
  //     final List<String> contentLines = contentString.trim().split('\n');
  //     final String title = contentLines[0];
  //     contentLines.removeAt(0);
  //     final List<String> content = contentLines;
  //     return HadithModel(title: title, content: content);
  //   }).toList();
  //   setState(() {});
  // }
}
