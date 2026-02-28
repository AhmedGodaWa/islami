import 'package:hive/hive.dart';
import 'package:islami/features/hadith/hadith_source.dart';
import 'package:islami/models/hadith_model.dart';

final BookmarkRepo = BookmarkRepository();

class BookmarkRepository {
  final Box box = Hive.box('bookmarks');

  Set<String> getSavedIds() {
    return box.keys.cast<String>().toSet();
  }

  bool isSaved(String id) {
    return box.containsKey(id);
  }

  void toggle(HadithModel hadith) {
    if (box.containsKey(hadith.id)) {
      box.delete(hadith.id);
    } else {
      box.put(hadith.id, {
        'id': hadith.id,
        'title': hadith.title,
        'content': hadith.content,
        'bookName': hadith.bookName ?? '',
      });
    }
  }

  List<HadithModel> getSavedHadiths() {
    final values = box.values.toList();

    return values
        // ✅ تجاهل أي بيانات قديمة غلط
        .where((e) => e is Map)
        .map((data) {
          final map = Map<String, dynamic>.from(data);

          return HadithModel(
            id: map['id'],
            title: map['title'],
            content: List<String>.from(map['content']),
            bookName: map['bookName'],
            source: HadithSource.local,
          );
        })
        .toList();
  }
}
