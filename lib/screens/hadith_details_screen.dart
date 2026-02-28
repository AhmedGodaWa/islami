import 'package:flutter/material.dart';
import 'package:islami/features/hadith/data/bookmark_repository.dart';
import 'package:islami/models/hadith_model.dart';

class HadithDetailsScreen extends StatefulWidget {
  static const String routeName = '/hadith-details';
  const HadithDetailsScreen({super.key});

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  bool isBookMarked = false;
  bool _initialized = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      final hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;

      isBookMarked = BookmarkRepo.isSaved(hadith.id);

      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final hadith = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight:
              MediaQuery.sizeOf(context).height * 0.1, // نزود ارتفاع بسيط
          actions: [
            IconButton(
              onPressed: () {
                final hadith =
                    ModalRoute.of(context)!.settings.arguments as HadithModel;
                setState(() {
                  BookmarkRepo.toggle(hadith);
                  isBookMarked = BookmarkRepo.isSaved(hadith.id);
                });
              },
              icon: Icon(isBookMarked ? Icons.bookmark : Icons.bookmark_border),
            ),
          ],
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// رقم الحديث
              Text(
                hadith.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 3),

              /// اسم الكتاب (لو موجود)
              if (hadith.bookName != null)
                Text(
                  hadith.bookName!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),

              const SizedBox(height: 8),

              /// خط زخرفي بسيط
              Container(
                width: 60,
                height: 2,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * 0.08,
            horizontal: MediaQuery.sizeOf(context).width * 0.04,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Text(
              hadith.content.join('\n'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
