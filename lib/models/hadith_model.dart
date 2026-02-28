import 'package:islami/features/hadith/hadith_source.dart';

class HadithModel {
  final String title;
  final List<String> content;
  final HadithSource source;
  final String? bookName;
  final String id;

  HadithModel({
    required this.title,
    required this.id,
    required this.content,
    required this.source,
    this.bookName,
  });
}
