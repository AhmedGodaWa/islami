import 'package:flutter/material.dart';
import 'package:islami/models/suras_list_model.dart';

class SuraListItem extends StatelessWidget {
  final SurasListModel sura;
  final VoidCallback onTap;

  const SuraListItem({super.key, required this.sura,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: Text(
              sura.suraName,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 15, child: VerticalDivider()),
          Expanded(
            child: Text(
              '${sura.versesCount}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
