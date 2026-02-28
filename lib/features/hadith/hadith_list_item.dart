import 'package:flutter/material.dart';
import 'package:islami/models/hadith_model.dart';
import 'package:islami/screens/hadith_details_screen.dart';

class HadithListItem extends StatelessWidget {
  const HadithListItem({
    super.key,
    this.useIndexNumber = true,
    required this.hadith,
    required this.index,
  });
  final HadithModel hadith;
  final int index;
  final bool useIndexNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => Navigator.pushNamed(
            context,
            HadithDetailsScreen.routeName,
            arguments: hadith,
          ),
          child: Text(
            useIndexNumber ? 'حديث رقم ${index + 1}' : hadith.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1),
      ],
    );
  }
}
