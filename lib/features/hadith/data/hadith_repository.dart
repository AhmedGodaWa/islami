// import 'package:flutter/services.dart';
// import 'package:islami/models/hadith_model.dart';

// class HadithLoader {
//   Future<void> loadHadithFile() async {
//     String fileContent = await rootBundle.loadString(
//       'assets/texts/ahadeth.txt',
//     );
//     List<String> hadithString = fileContent.split('#');
//     hadithList = hadithString.map((contentString) {
//       List<String> contentLines = contentString.trim().split('\n');
//       String title = contentLines[0];
//       contentLines.removeAt(0);
//       List<String> content = contentLines;
//       return HadithModel(title: title, content: content);
//     }).toList();

//   }
// }

import 'package:islami/features/hadith/data/hadith_local_data_source.dart';
import 'package:islami/features/hadith/data/hadith_remote_data_source.dart';
import 'package:islami/features/hadith/hadith_mode.dart';
import 'package:islami/models/hadith_model.dart';

class HadithRepository {
  HadithRepository._();

  static final HadithRepository instance = HadithRepository._();

  final HadithLocalDataSource _local = HadithLocalDataSource();

  final HadithRemoteDataSource _remote = HadithRemoteDataSource();

  List<HadithModel> cachedOnline = [];

  Future<List<HadithModel>> loadHadith(HadithMode mode) async {
    if (mode == HadithMode.online) {
      try {
        final data = await _remote.loadHadith();
        cachedOnline = data;
        return data;
      } catch (_) {
        return _local.loadHadith();
      }
    }
    return _local.loadHadith();
  }

  List<HadithModel> getOnlineCache() => cachedOnline;
}
