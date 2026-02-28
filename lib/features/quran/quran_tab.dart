import 'package:flutter/material.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'package:islami/features/quran/sura_data.dart';
import 'package:islami/features/quran/sura_list_item.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header_icn.png',
          height: MediaQuery.sizeOf(context).height * 0.25,
        ),
        //Row(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 20),
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
            separatorBuilder: (_, _) => const SizedBox(child: Divider()),
            itemCount: suras.length,
          ),
        ),
      ],
    );
  }
}
