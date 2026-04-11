import 'package:flutter/material.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'package:islami/features/quran/sura_data.dart';
import 'package:islami/features/quran/sura_list_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    final dividerColor = Theme.of(context).dividerTheme.color;
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        const SizedBox(height: 8),

        Divider(color: dividerColor, thickness: 2),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Verses',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              VerticalDivider(thickness: 2, color: dividerColor),
              Expanded(
                child: Text(
                  'Sura name',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
        Divider(color: dividerColor, thickness: 2),
        Expanded(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(width: 2, color: dividerColor),
              ),
              ListView.separated(
                itemBuilder: (_, index) {
                  //final SurasListModel sura = suras[index];
                  return SuraListItem(
                    sura: suras[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SuraDetailsScreen.routeName,
                        arguments: SuraDetailsArgs(
                          suraName: suras[index].suraName,
                          index: index,
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, _) =>
                    const SizedBox(child: Divider(color: Colors.grey)),
                itemCount: suras.length,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
