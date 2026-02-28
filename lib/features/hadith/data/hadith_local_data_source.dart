import 'package:flutter/services.dart';
import 'package:islami/features/hadith/hadith_source.dart';
import 'package:islami/models/hadith_model.dart';

class HadithLocalDataSource {
  Future<List<HadithModel>> loadHadith() async {
    // اقرأ الملف
    final String fileContent = await rootBundle.loadString(
      'assets/texts/ahadeth.txt',
    );

    // اقسم الأحاديث
    List<String> hadithStrings = fileContent.split('#');

    hadithStrings = hadithStrings.where((e) => e.trim().isNotEmpty).toList();

    // حول النص → Models
    final List<HadithModel> hadithList = hadithStrings.asMap().entries.map((
      entry,
    ) {
      final index = entry.key;
      final contentString = entry.value;

      final List<String> contentLines = contentString.trim().split('\n');

      final String title = contentLines.first;

      contentLines.removeAt(0);

      return HadithModel(
        id: index.toString(), //  FIX
        title: title,
        content: contentLines,
        source: HadithSource.local,
      );
    }).toList();

    return hadithList;
  }
}
