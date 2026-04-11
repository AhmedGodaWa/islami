import 'package:flutter/material.dart';
import 'package:islami/features/hadith/data/bookmark_repository.dart';
import 'package:islami/features/hadith/data/hadith_repository.dart';
import 'package:islami/features/hadith/hadith_list_item.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/widgets/app_background.dart';
import 'package:islami/widgets/loading_indicator.dart';

class SavedHadithScreen extends StatefulWidget {
  static const String routeName = 'saved-hadith';
  const SavedHadithScreen({super.key});

  @override
  State<SavedHadithScreen> createState() => _SavedHadithScreenState();
}

class _SavedHadithScreenState extends State<SavedHadithScreen> {
  final hadithRepo = HadithRepository.instance;

  List<HadithModel> savedHadiths = [];

  bool isLoading = true;

  Future<void> loadSavedHadiths() async {
    savedHadiths = bookmarkRepo.getSavedHadiths();

    setState(() {
      isLoading = false;
    });
  }
  // Future<void> loadSavedHadiths() async {
  //   //  هات كل الأحاديث
  //   final offline = await hadithRepo.loadHadith(HadithMode.offline);

  //   final online = hadithRepo.getOnlineCache();
  //   final allHadiths = [...offline, ...online];

  //   //  هات ids المحفوظة
  //   final savedIds = BookmarkRepo.getSavedIds();

  //   //  فلترة
  //   savedHadiths = allHadiths
  //       .where((hadith) => savedIds.contains(hadith.id))
  //       .toList();

  //   //  وقف loading
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    loadSavedHadiths();
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(
      //       Theme.of(context).brightness == Brightness.dark
      //           ? 'assets/images/background_image_dark.png'
      //           : 'assets/images/background_image.png',
      //     ),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'المحفوظات',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: isLoading
            ? const Center(child: LoadingIndicator())
            : savedHadiths.isEmpty
            ? Center(
                child: Text(
                  'There are no preserved hadiths.',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * 0.09,
                ),
                itemCount: savedHadiths.length,
                itemBuilder: (_, index) {
                  final hadith = savedHadiths[index];

                  return HadithListItem(
                    hadith: hadith,
                    index: index,
                    useIndexNumber: false,
                  );
                },
              ),
      ),
    );
  }
}
