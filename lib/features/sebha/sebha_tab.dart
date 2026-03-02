import 'package:flutter/material.dart';
import 'package:islami/features/sebha/controller/sebha_controller.dart';

import 'package:islami/features/sebha/widgets/counter_section.dart';
import 'package:islami/features/sebha/widgets/reset_button.dart';
import 'package:islami/features/sebha/widgets/sebha_view.dart';
import 'package:islami/features/sebha/widgets/zekr_bottom_sheet.dart';
import 'package:islami/features/sebha/widgets/zekr_section.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  // int counter = 0;
  // String? currentZekr;
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SebhaController>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 30),
          SebhaView(onTap: controller.increment),
          const SizedBox(height: 40),
          CounterSection(count: controller.counter),
          const SizedBox(height: 25),
          ZekrSection(onTap: openZekrSheet, zekr: controller.currentZekr),
          const SizedBox(height: 25),
          ResetButton(onTap: controller.reset),
        ],
      ),
    );
  }

  Future<void> openZekrSheet() async {
    final controller = context.read<SebhaController>();
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ZekrBottomSheet(initialZekr: controller.currentZekr);
      },
    );

    if (result != null) {
      controller.updateZekr(result);
    }
  }
}
