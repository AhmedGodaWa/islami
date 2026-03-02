import 'package:flutter/material.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('عدد التسبيحات', style: TextTheme.of(context).headlineSmall),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFDFDEDE),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(55),
                blurRadius: 8,
                offset: const Offset(0, 3.5),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('$count', style: TextTheme.of(context).titleLarge),
        ),
      ],
    );
  }
}
