import 'package:flutter/material.dart';

class RadioTitleSection extends StatelessWidget {
  const RadioTitleSection({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextTheme.of(
          context,
        ).headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
