import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:islami/features/hadith/data/api_constants.dart';
import 'package:islami/features/hadith/hadith_source.dart';
import 'package:islami/models/hadith_model.dart';

class HadithRemoteDataSource {
  Future<List<HadithModel>> loadHadith() async {
    final random = Random();

    /// نبدأ من صفحة عشوائية
    final int startPage = random.nextInt(200) + 1;

    final List<HadithModel> allHadiths = [];

    /// نجيب صفحتين = 50 حديث
    for (int page = startPage; page < startPage + 2; page++) {
      final uri = Uri.https('hadithapi.com', '/public/api/hadiths', {
        'apiKey': ApiConstants.apiKey,
        'page': page.toString(),
      });

      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception('Failed to load hadiths');
      }

      final data = jsonDecode(utf8.decode(response.bodyBytes));

      final List hadiths = data['hadiths']['data'];

      final mapped = hadiths.map<HadithModel>((h) {
        return HadithModel(
          title: 'حديث رقم ${h['hadithNumber']}',
          content: [h['hadithArabic'] ?? ''],
          source: HadithSource.remote,
          bookName: h['bookSlug'] ?? '',
          id: h['id'].toString(),
        );
      }).toList();

      allHadiths.addAll(mapped);
    }

    return allHadiths;
  }
}

// class HadithRemoteDataSource {
//   Future<List<HadithModel>> loadHadith() async {
//     await Future.delayed(const Duration(seconds: 2));
//     return [
//       HadithModel(
//         title: 'الحديث الاول',
//         content: ['الحديث الاول بعد كدا هنجيبه من ال api'],
//         source: HadithSource.remote,
//       ),
//       HadithModel(
//         title: 'الحديث الاول',
//         content: ['الحديث الاول بعد كدا هنجيبه من ال api'],
//         source: HadithSource.remote,
//       ),
//     ];
//   }
// }
